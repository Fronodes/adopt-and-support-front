import 'package:flutter/material.dart';
import '../../../core/core_shelf.dart';

class DonateButton extends StatelessWidget {
  const DonateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: context.height * 8,
      width: double.infinity,
      decoration: BoxDeco().donateCard(context),
      child: Container(
        width: double.infinity,
        child: Center(
          child: Text(
            'Donate',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
