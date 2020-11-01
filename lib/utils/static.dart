import 'package:dio/dio.dart';
import 'api_path.dart';

class Static {
  Static._();

  static Dio dio() {
    final Dio baseClient = Dio(
      BaseOptions(
        baseUrl: ApiPath.baseUrl,
      ),
    );
    baseClient.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return baseClient;
  }
}