import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../core/core_shelf.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
              child: Container(
                  padding: context.highPadding,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: context.primary.withOpacity(.4),
                      boxShadow: [
                        //BoxShadow(blurRadius: 15, color: context.disabled)
                      ]),
                  child: Lottie.asset('images/gif/pug.json'))),
          Expanded(child: Container(child: Container())),
        ],
      ),
    );
  }
}
