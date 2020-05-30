import 'package:dio/dio.dart';
import 'package:quick_loan_demo/services/api.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:async';

class BaseService {
  Dio dio = new Dio(new BaseOptions(
    baseUrl: '${API.baseDomain}${API.basePath}',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: Headers.jsonContentType,
  ));

  dioInstance({String method, String url, Object queryParameters, Object data, Object headers, bool showLoading = true}) async {
    try {
      var response;
      if(showLoading) {
        EasyLoading.show(status: 'loading...');
      }
      switch (method) {
        case 'get':
          response = await dio.get(
            url,
            queryParameters: queryParameters,
            options: getOptions(headers),
          );
          break;
        case 'post':
          response = await dio.post(
            url,
            data: data,
            options: getOptions(headers),
          );
          break;
        default:
          break;
      }
      if(showLoading) {
        EasyLoading.dismiss();
      }
      return response;
    } catch (error) {
      EasyLoading.showError(error);
    }
  }

  getOptions(headers) {
    return Options(headers: headers);
  }
}
