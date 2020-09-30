import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ObsWebsocket {
  String _address;
  String _port;
  String _password;
  int _debug = 1;
  WebSocketChannel _channel;
  Stream<dynamic> _broadcast;
  int _messageId = 0;

  String getSddress() {
    return this._address;
  }

  String getPort() {
    return this._port;
  }

  String getPassword() {
    return this._password;
  }

  int getDebug() {
    return this._debug;
  }

  void setAddress(String variable) {
    this._address = variable;
  }

  void setPort(String variable) {
    this._port = variable;
  }

  void setPassword(String variable) {
    this._password = variable;
  }

  void setDebug(int variable) {
    this._debug = variable;
  }

  connect() async {
    var salt;
    var challenge;
    String secret;
    String authReponse;

    this.debug(1, 'CONECTING!!!!!');
    this.debug(1, 'ws://${this._address}:${this._port}');
    this._channel = WebSocketChannel.connect(
      Uri.parse('ws://${this._address}:${this._port}'),
    );
    this.debug(1, 'CHANNEL READY!');
    this._broadcast = this._channel.stream.asBroadcastStream();
    this.debug(1, 'BROADCAST READY!');

    var getAuth = await this.send('GetAuthRequired');
    if (getAuth['authRequired']) {
      this.debug(1, 'NEEDS AUTHENTICATION');
      salt = getAuth['salt'];
      challenge = getAuth['challenge'];

      secret = base64Hash(this._password + salt);
      authReponse = base64Hash(secret + challenge);

      if (this._password.isEmpty) {
        throw Exception('Type in you password!');
      }

      this.debug(1, 'AUTHENTICATING!');
      return await this.send('Authenticate', {'auth': authReponse}).then(
          (value) => this.debug(1, 'CONNECTED!!!!!!!!'));
    }
  }

  Future send(String method, [Map<String, dynamic> args]) async {
    this._messageId++;

    this.debug(1, 'SENDING SINK: ' + method);
    Map<String, dynamic> payload = {
      'message-id': this._messageId.toString(),
    };
    var response;

    payload["request-type"] = method;

    if (args != null) {
      payload.addAll(args);
    }
    final String requestPayload = jsonEncode(payload);
    this.debug(1, 'PAYLOAD: ' + requestPayload);
    this._channel.sink.add(requestPayload);

    await for (String message in this._broadcast) {
      response = json.decode(message);

      if (response['message-id'] == this._messageId.toString()) {
        if (response['status'] != 'ok') {
          throw Exception(message);
        }
        break;
      }
    }

    this.debug(2, 'RESPONSE: ' + response.toString());
    return response;
  }

  Stream<dynamic> event(String method) {
    return this
        ._broadcast
        .where((message) {
          this.debug(3, 'MESSAGE: ' + message);
          var response = json.decode(message);
          if (response['update-type'] == method) {
            return true;
          }
          return false;
        })
        .distinct()
        .map((message) => json.decode(message));
  }

  String base64Hash(String data) {
    final Digest hash = sha256.convert(utf8.encode(data));
    final String secret = base64.encode(hash.bytes);
    return secret;
  }

  void debug(int level, String message) {
    if (level <= this._debug) {
      print(message);
    }
  }
}
