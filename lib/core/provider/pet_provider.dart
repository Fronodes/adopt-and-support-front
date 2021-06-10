import 'package:flutter/material.dart';

import '../core_shelf.dart';
import '../services/pet/pet.dart';

class PetProvider extends ChangeNotifier {
  List<Pet> queryResults = [];

  List<Pet> pets = [];

  Pet? selectedPet = Pet(
      '1',
      'Kedi',
      [
        'https://i.ytimg.com/vi/1Ne1hqOXKKI/maxresdefault.jpg',
        'https://i.ytimg.com/vi/jHWKtQHXVJg/maxresdefault.jpg',
        'https://i.guim.co.uk/img/media/8a13052d4db7dcd508af948e5db7b04598e03190/0_294_5616_3370/master/5616.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=bcaa4eed2c1e6dab61c41a61e41433d9'
      ],
      'Cat',
      'Male',
      2,
      10,
      'Summary will be here',
      User(
          '2',
          'Person',
          '10310321',
          Address('cadde', 'mahalle', 'fatih', 'istanbul'),
          'mail.com',
          'https://i.ytimg.com/vi/1Ne1hqOXKKI/maxresdefault.jpg', []),
      'a');

  Pet getSelectedPet() {
    return selectedPet!;
  }

  Future<List<Pet>> getPets() async {
    pets = await PetApiService().getAllPets();
    return pets;
  }

  Future<List<Pet>> searchPet(String province) async {
    queryResults = await PetApiService().getPetsByProvince(province);
    return queryResults;
  }

  Future<bool> addToFav(petId) async {
    try {
      await PetApiService().addToFavoritePets(petId);
      notifyListeners();

      return true;
    } catch (e) {
      notifyListeners();
      return false;
    }
  }
}
