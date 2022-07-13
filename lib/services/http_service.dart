

import 'dart:convert';

import 'package:autoproject/models/response_base.dart';
import 'package:http/http.dart';

/// Http service utility
class HttpService {
  late String _apiUrl;
  // late String _serviceUrl;
  // late String? _serviceApiUrl;
  // final SecureService _secureService = Injector().get<SecureService>();

  HttpService() {
    _apiUrl = 'https://www.thecocktaildb.com/api/json/';
    // _serviceUrl = FlutterConfig.get('SERVICES_URL') as String;
    // _serviceApiUrl = FlutterConfig.get('SERVICES_API_URL') as String?;
  }

  /// Request in GET
  Future<ResponseBase> httpGet(String url) async {
    var uri = Uri.parse(_apiUrl + url);
   
    print(uri);
    ResponseBase responseBase = ResponseBase();
    
    Response response = await get(uri);
    if (response.statusCode == 401) {
      print("error 401");
    } else if (response.statusCode == 200) {
      responseBase.success = true;
      responseBase.data = response.body.toString();
    } else {
      responseBase.success = false;
      responseBase.errorMessage = jsonDecode(response.body)['error']['message'];
    }
    return responseBase;
  }

}