import 'package:dio/dio.dart';
import 'package:quick_loan_demo/services/api.dart';

class BaseService {
  Dio dio = new Dio(new BaseOptions(
    baseUrl: '${API.baseDomain}${API.basePath}',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: Headers.jsonContentType,
  ));

  dioInstance({String method, String url, Object queryParameters, Object data, Object headers}) {
    switch (method) {
      case 'get':
        return dio.get(
          url,
          queryParameters: queryParameters,
          options: getOptions(headers),
        );
      case 'post':
        return dio.post(
          url,
          data: data,
          options: getOptions(headers),
        );
        break;
      default:
        break;
    }
  }

  getOptions(headers) {
    return Options(headers: headers);
  }
}
