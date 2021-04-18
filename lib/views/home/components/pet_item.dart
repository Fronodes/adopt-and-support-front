import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

class PetItem extends StatelessWidget {
  final Pet pet;
  final String type;
  const PetItem({required this.pet, this.type = 'pet'});

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
            Expanded(flex: type == 'pet' ? 6 : 3, child: getPhoto(context)),
            SizedBox(height: context.height * 1.5),
            Expanded(child: getPetName(context)),
            SizedBox(height: context.height * .3),
            type == 'pet'
                ? Expanded(child: LocationRow(text: pet.summary))
                : Container()
          ],
        ),
      ),
    );
  }

  Widget getPhoto(BuildContext context) {
    return Hero(
      tag: pet.id,
      child: ClipRRect(
        borderRadius: context.highCircular,
        child: FadeInImage.assetNetwork(
          placeholder: 'loading'.gifPath,
          width: context.width * 48,
          fit: BoxFit.cover,
          image: 'https://e28c51664e12.ngrok.io${pet.photoUrls[0]}',
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
