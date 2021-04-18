import 'dart:io';

import 'package:flutter/material.dart';

import '../../views/home/components/pet_item.dart';
import '../core_shelf.dart';

class CustomGridView extends StatelessWidget {
  final List list;
  final String type;
  const CustomGridView({required this.list, required this.type});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: BouncingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: type == 'pet' ? 1.1 : 1.2,
      children: [
        ...list.map(
          (pet) => type == 'pet' || type == 'adopt'
              ? Padding(
                  padding: context.lowPadding,
                  child: PetItem(pet: pet, type: 'adopt'),
                )
              : Container(),
        ),
        type == 'adopt'
            ? Container(
                margin: EdgeInsets.only(
                  left: context.width,
                  right: context.width * 3,
                  bottom: context.height * 5,
                ),
                child: AddImageLargeButton(
                    onPressed: navigateToAddAdopt, type: 'newPage'))
            : Container()
      ],
    );
  }

  void navigateToAddAdopt(File file) {
    NavigationService.instance
        .navigateToPage(path: NavigationConstants.createNewAdopted);
  }
}
