import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

class PetSearchItem extends StatelessWidget {
  final Pet pet;
  const PetSearchItem({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 10,
      margin: context.lowPadding,
      padding: context.mediumPadding,
      decoration: BoxDeco().donateCard(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: getPhoto(context)),
          SizedBox(width: context.width * 5),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(pet.name,
                      style: context.headline3, textAlign: TextAlign.start),
                ),
                SizedBox(
                  height: context.height * .6,
                ),
                LocationRow(
                  text: pet.owner!.address.province,
                ),
              ],
            ),
          )
        ],
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
          fit: BoxFit.cover,
          image: 'https://f682c61e0edc.ngrok.io${pet.photoUrls[0]}',
        ),
      ),
    );
  }
}
