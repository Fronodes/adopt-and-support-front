import 'package:dio/dio.dart';

import '../../core_shelf.dart';

class UserApiService {
  final String _endpoint = 'https://e28c51664e12.ngrok.io/api/user';
  final Dio _dio = Dio();

  Future registerUser(
    String email,
    String name,
    String surname,
    String password,
    String phoneNumber,
    String street,
    String neighborhood,
    String district,
    String province,
    image,
  ) async {
    try {
      var formData = FormData.fromMap({
        'email': email,
        'password': password,
        'name': name,
        'surname': surname,
        'phoneNumber': phoneNumber,
        'street': street,
        'neighborhood': neighborhood,
        'district': district,
        'province': province,
        'image': await MultipartFile.fromFile(image, filename: '$image\_')
      });

      var response = await _dio.post(
        _endpoint,
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );
      return User.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      return User.withError('$error');
    }
  }

  Future<User> loginUser(String email, String password) async {
    try {
      print('$_endpoint/login');
      var body = {'email': email, 'password': password};
      var response = await _dio.post(
        '$_endpoint/login',
        data: body,
      );
      await LocaleManager.instance.setStringValue(
          PreferencesKeys.accessToken, response.data['accessToken']);
      return User.fromJson(response.data['user']);
    } on DioError catch (error, stacktrace) {
      var api = LanguageProvider();
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(api.appLocal.languageCode == 'en'
          ? '${error.response?.data['resultMessage']['en']}'
          : '${error.response?.data['resultMessage']['tr']}');
    }
  }
}
