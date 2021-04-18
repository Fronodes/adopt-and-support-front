import 'package:dio/dio.dart';

class CategoryApiService {
  final String _endpoint = 'https://e28c51664e12.ngrok.io/api/categories';
  final Dio _dio = Dio();

  Future<List> getCategories() async {
    try {
      var response = await _dio.get(_endpoint);
      var responseData = response.data['categories'];
      print(responseData);
      return responseData;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      rethrow;
    }
  }
}
