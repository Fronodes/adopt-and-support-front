import 'package:flutter/material.dart';
import '../../../core/core_shelf.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDeco().typeItemDeco(context, false),
            height: context.height * 8,
            width: context.width * 46,
            child: Row(
              children: [
                Image.asset('assets/images/masterCard.png'),
                Text('Credit Card')
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDeco().typeItemDeco(context, false),
            height: context.height * 8,
            width: context.width * 46,
            child: Row(
              children: [
                Image.asset('assets/images/moneyTransfer.png'),
                Text('Money Transfer')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
