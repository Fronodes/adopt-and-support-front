import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../core_shelf.dart';

class SlidingPage extends StatelessWidget {
  final String? type;
  final List photoUrls;
  final Function(int) func;
  final PageController controller;
  final String id;
  final int currentIndex;
  const SlidingPage(
      {required this.func,
      required this.controller,
      required this.photoUrls,
      required this.id,
      required this.currentIndex,
      this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 9, child: getPageView(context)),
        Expanded(flex: 1, child: getDotIndicator(context))
      ],
    );
  }

  Widget getPageView(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      onPageChanged: func,
      children: [
        ...photoUrls.map(
          (photo) => Padding(
            padding: context.highPadding,
            child: Hero(
              tag: id,
              child: ClipRRect(
                borderRadius: context.highCircular,
                child: (type == null || kIsWeb)
                    ? Image.network(
                        'https://f682c61e0edc.ngrok.io$photo',
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'https://f682c61e0edc.ngrok.io$photo',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getDotIndicator(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < photoUrls.length; i++)
          AnimatedContainer(
            duration: Duration(milliseconds: 350),
            margin: context.rightLow,
            height: context.height * 1.2,
            width: i == currentIndex ? context.width * 9 : context.width * 4,
            decoration: BoxDecoration(
              color: i == currentIndex ? context.primary : Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
            ),
          )
      ],
    );
  }
}
