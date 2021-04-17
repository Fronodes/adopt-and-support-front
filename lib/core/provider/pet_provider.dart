import 'package:flutter/material.dart';

import '../core_shelf.dart';

class PetProvider extends ChangeNotifier {
  List<Pet> queryResults = [];
  List<Pet> pets = [
    Pet(
      '1',
      'Kedi',
      [],
      'Cat',
      'Male',
      2,
      10,
      'Summary will be here',
      User(
        '2',
        'Person',
        'Here',
        '10310321',
        Address('cadde', 'mahalle', 'fatih', 'istanbul'),
        'mail.com',
        'https://i.ytimg.com/vi/1Ne1hqOXKKI/maxresdefault.jpg',
      ),
    )
  ];

  Future<List<Pet>> searchPet() async {
    return pets;
  }
}
