import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

class PetItem extends StatelessWidget {
  final Pet pet;
  const PetItem({required this.pet});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => NavigationService.instance
          .navigateToPage(path: NavigationConstants.petDetail),
      child: Container(
        margin: EdgeInsets.only(right: context.width * 4),
        width: context.width * 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: getPhoto(context)),
            SizedBox(height: context.height * 1.2),
            getPetName(context),
            SizedBox(height: context.height * .4),
            LocationRow(text: pet.summary)
          ],
        ),
      ),
    );
  }

  Widget getPhoto(BuildContext context) {
    return Hero(
      tag: pet.photoUrls[0],
      child: ClipRRect(
        borderRadius: context.highCircular,
        child: Image.network(
          pet.photoUrls[0],
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget getPetName(BuildContext context) {
    return Text(
      pet.name,
      style: TextStyle(
        color: Colors.black87,
        fontSize: context.fontSize * 2.7,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Future<void> navigateToDetail() async {
    //TODO: Get by id
    await NavigationService.instance
        .navigateToPage(path: NavigationConstants.petDetail);
  }
}
