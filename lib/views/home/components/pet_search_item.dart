import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

class PetSearchItem extends StatelessWidget {
  final Pet pet;
  const PetSearchItem({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [getPhoto(context)],
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
          image: 'https://e28c51664e12.ngrok.io${pet.photoUrls[0]}',
        ),
      ),
    );
  }
}
