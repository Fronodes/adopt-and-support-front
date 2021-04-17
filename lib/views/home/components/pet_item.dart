import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

class PetItem extends StatelessWidget {
  final Pet pet;
  const PetItem({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: context.width * 4),
      width: context.width * 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: getPhoto(context)),
          SizedBox(height: context.height * 1.2),
          getPetName(context),
          SizedBox(height: context.height * .4),
          getInfoRow(context)
        ],
      ),
    );
  }

  Widget getPhoto(BuildContext context) {
    return ClipRRect(
      borderRadius: context.highCircular,
      child: Image.asset(
        pet.photoUrls[0],
        fit: BoxFit.fitHeight,
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

  Widget getInfoRow(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.navigation,
          color: Colors.green[300],
          size: context.width * 3.6,
        ),
        SizedBox(width: context.width * .8),
        Text(
          pet.summary,
          style: context.headline5.copyWith(
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}
