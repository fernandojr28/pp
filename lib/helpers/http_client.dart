import 'dart:convert';
import 'dart:io';
//import 'package:flutter_user_agentx/flutter_user_agent.dart';
import 'package:client_information/client_information.dart';
import 'package:http/http.dart';


class ApiHttpClient extends BaseClient {

  ApiHttpClient(this._inner, {this.token, this.headers});

  final Client _inner;
  final String? token;
  final Map<String, String>? headers;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    //request.headers[HttpHeaders.userAgentHeader] =
      //  await FlutterUserAgent.getPropertyAsync('userAgent');
    request.headers[HttpHeaders.contentTypeHeader] = "application/json";

    ClientInformation info = await ClientInformation.fetch();

    //String deviceId = await getDeviceIdentifier();
    request.headers['device'] = base64.encode(utf8.encode(
        jsonEncode({"device_id": info.deviceId, "type": Platform.operatingSystem})));

    final headers = this.headers;
    if (headers != null) {
      headers.forEach((k, v) {
        request.headers[k] = v;
      });
    }
      
    if (token != null) {
      request.headers[HttpHeaders.authorizationHeader] = "Bearer $token";
    }

    return _inner.send(request);
  }

}
