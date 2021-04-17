import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

class ContactPerson extends StatelessWidget {
  final User user;
  const ContactPerson({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'contact_person'.translate,
          style: context.headline3,
        ),
        SizedBox(height: context.height),
        Expanded(
          child: Container(
            decoration: BoxDeco().donateCard(context),
            child: person(context),
          ),
        ),
      ],
    );
  }

  Widget person(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: context.highCircular,
            ),
            padding: EdgeInsets.symmetric(horizontal: context.width * 3.5),
            child: Image(
              image: 'no_user'.pngImageAsset,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: context.headline4
                      .copyWith(fontSize: context.fontSize * 2.8),
                ),
                SizedBox(height: context.height * .7),
                LocationRow(text: user.address.province),
              ],
            )),
        getIcon(context, Icons.call, call, Colors.green),
        SizedBox(width: context.width * 2),
        getIcon(context, Icons.mail, mail, context.primary),
        SizedBox(width: context.width * 3)
      ],
    );
  }

  Widget getIcon(
      BuildContext context, IconData icon, Function() func, Color color) {
    return Expanded(
      child: InkWell(
        onTap: func,
        child: Container(
          height: context.height * 4.8,
          width: context.height * 4.8,
          decoration: BoxDecoration(
            borderRadius: context.highCircular,
            color: color.withOpacity(.11),
          ),
          child: Icon(
            icon,
            color: color,
            size: context.width * 4.7,
          ),
        ),
      ),
    );
  }

  void call() {}
  void mail() {}
}
