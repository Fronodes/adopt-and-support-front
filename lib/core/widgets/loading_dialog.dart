import 'package:flutter/material.dart';

import '../core_shelf.dart';

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      useRootNavigator: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            key: key,
            backgroundColor: Theme.of(context).canvasColor,
            children: <Widget>[
              Center(
                child: Column(children: [
                  CircularProgressIndicator(),
                  SizedBox(height: context.height * 3),
                  Text(
                    'please_wait'.translate,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )
                ]),
              )
            ],
          ),
        );
      },
    );
  }
}
