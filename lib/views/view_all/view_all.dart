import 'package:flutter/material.dart';

import '../../core/core_shelf.dart';
import '../../core/dummy/dummy_pet.dart';
import '../home/components/components_shelf.dart';

class ViewAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = <Pet>[];
    for (var i = 0; i < 10; i++) {
      list.add(getDummyPet());
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
        child: GridView.count(
          physics: BouncingScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 1.1,
          children: [...list.map((pet) => PetItem(pet: pet))],
        ),
      ),
    );
  }

  void close() {
    NavigationService.instance.pop();
  }
}
