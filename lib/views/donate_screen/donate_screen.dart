import 'package:flutter/material.dart';

import './componenets/payment_methods.dart';
import './componenets/pricing_card.dart';
// ignore: directives_ordering
import '../../core/core_shelf.dart';
import 'componenets/donate_button.dart';

class DonateScreen extends StatefulWidget {
  @override
  _DonateScreenState createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  String? selectedPackage;
  String? selectedMethod;

  void select(String id) {
    setState(() {
      selectedPackage = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, 'donate_us'.translate, 'donate'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: context.height * 25,
            child: Image.asset(
              'assets/images/donate.png',
              fit: BoxFit.cover,
              scale: 2,
            ),
          ),
          Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => select(index.toString()),
                    child: PricingCard(
                        id: index.toString(),
                        isSelected: selectedPackage == index.toString()),
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Text(
              'payment_method'.translate,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
          PaymentMethods(),
          DonateButton()
        ],
      ),
    );
  }
}
