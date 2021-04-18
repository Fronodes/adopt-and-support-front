import 'package:flutter/material.dart';

import '../../core/core_shelf.dart';
import '../../core/dummy/dummy_pet.dart';

class ViewAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Pet> petList = [];
    for (var i = 0; i < 10; i++) {
      var pet = getDummyPet();
      pet.id = i.toString();
      petList.add(pet);
    }
    return Scaffold(
      appBar: getAppBar(context, 'see_all'.translate, 'close'),
      body: Padding(
        padding: EdgeInsets.only(
          left: context.width * 7,
          right: context.width * 4,
          top: context.height * 3,
          bottom: context.height * 2,
        ),
        child: CustomGridView(
          list: petList,
          type: 'pet',
        ),
      ),
    );
  }

  void close() {
    NavigationService.instance.pop();
  }
}
