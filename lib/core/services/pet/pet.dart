import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../core_shelf.dart';

class PetApiService {
  final String _endpoint = 'https://e28c51664e12.ngrok.io/api/pets';
  final Dio _dio = Dio();

  Future getAllPets() async {
    List<Pet> tempPetList = [];
    try {
      var response = await _dio.get(_endpoint);
      var responseData = response.data['pets'];
      responseData.forEach((pet) => tempPetList.add(Pet.fromJson(pet)));
      return tempPetList;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      rethrow;
    }
  }
}
