import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

class DonateUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: _donateSection(context),
    );
  }

  Container _donateSection(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDeco().donateCard(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _textSection(context),
          ),
          Expanded(
            child: _image(),
          )
        ],
      ),
    );
  }

  Center _textSection(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.leftLow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(context),
            SizedBox(height: context.height * .2),
            _subTitle(context)
          ],
        ),
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      'Donate us!',
      style: context.headline4.copyWith(
        color: context.primary,
        fontFamily: 'Effra',
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Text _subTitle(BuildContext context) {
    return Text(
      'Your donation helps us to run\n'
      'this greate service.',
      style: context.headline5.copyWith(
        color: Colors.black54,
        fontFamily: 'Effra',
      ),
    );
  }

  ClipPath _image() {
    return ClipPath(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      clipper: QuadraticClipper(),
      child: Image.network(
        'https://i.ytimg.com/vi/1Ne1hqOXKKI/maxresdefault.jpg',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
