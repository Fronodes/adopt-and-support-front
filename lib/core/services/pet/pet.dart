import 'dart:convert';

import 'package:dio/dio.dart';

import '../../core_shelf.dart';

class PetApiService {
  final String _endpoint = 'https://f682c61e0edc.ngrok.io/api/pets';
  final Dio _dio = Dio();

  Future<List<Pet>> getAllPets() async {
    var tempPetList = <Pet>[];
    try {
      var response = await _dio.get(_endpoint);
      var responseData = response.data['pets'];
      try {
        (responseData as List).forEach((element) {
          print(element['owner']);
          tempPetList.add(Pet.fromJson(element));
        });
      } catch (e, st) {
        print(st);
        rethrow;
      }
      return tempPetList;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Pet>> getPetsByProvince(String province) async {
    var tempPetList = <Pet>[];
    try {
      var response = await _dio
          .post('$_endpoint/byprovince', data: {'province': province});
      var responseData = response.data['pets'];

      responseData.forEach((pet) => tempPetList.add(Pet.fromJson(pet)));
      return tempPetList;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      rethrow;
    }
  }

  Future<List<Pet>> getFavoritePets() async {
    var tempPetList = <Pet>[];
    try {
      var token =
          LocaleManager.instance.getStringValue(PreferencesKeys.accessToken);
      var header = {'Authorization': token};
      var response = await _dio.post('$_endpoint/favorites',
          options: Options(headers: header));
      var responseData = response.data['favoritePets'];

      responseData.forEach((pet) => tempPetList.add(Pet.fromJson(pet)));
      return tempPetList;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      rethrow;
    }
  }

  Future<String> addToFavoritePets(String petId) async {
    try {
      var token =
          LocaleManager.instance.getStringValue(PreferencesKeys.accessToken);
      var header = {'Authorization': token};
      var body = {'petId': petId};
      var response = await _dio.put('$_endpoint/addtofavorites',
          data: body, options: Options(headers: header));
      var responseData = response.data['message'];
      return responseData; // Unfavorited or Favorited
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      rethrow;
    }
  }

  Future addPet(
    String name,
    String type,
    String gender,
    String age,
    String weight,
    String summary,
    String province,
    image,
  ) async {
    try {
      var formData = FormData.fromMap({
        'name': name,
        'type': type,
        'gender': gender,
        'age': age,
        'weight': weight,
        'summary': summary,
        'province': province,
        'image':
            image // [ await MultipartFile.fromFile(image1, filename: '$image1\_'), await MultipartFile.fromFile(image2, filename: '$image2\_')]
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

  Future<List<Pet>> getPetsByCategories(List categoryIds) async {
    var tempPetList = <Pet>[];
    try {
      var response = await _dio
          .post('$_endpoint/bycategories', data: {'categoryIds': categoryIds});
      var responseData = response.data['pets'];

      tempPetList = responseData.map((e) => Pet.fromJson(e));
      return tempPetList;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      rethrow;
    }
  }
}
