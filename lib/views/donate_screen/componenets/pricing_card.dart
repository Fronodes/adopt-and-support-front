import 'package:flutter/material.dart';
import '../../../core/core_shelf.dart';

class PricingCard extends StatefulWidget {
  final String id;
  final bool isSelected;

  const PricingCard({
    Key? key,
    required this.id,
    required this.isSelected,
  }) : super(
          key: key,
        );

  @override
  _PricingCardState createState() => _PricingCardState();
}

class _PricingCardState extends State<PricingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: context.height * 35,
      decoration: BoxDeco().typeItemDeco(context, widget.isSelected),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Bunny Package', style: TextStyle(fontSize: 20)),
            Text('10', style: TextStyle(fontSize: 20)),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Bu paket ile 1KG mama\nve\ntoplam 5 sokak\nhayvanını doyurabilirsiniz!',
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              'assets/images/food.png',
              height: context.height * 6,
            ),
          ],
        ),
      ),
    );
  }
}
