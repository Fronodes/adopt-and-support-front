import 'package:flutter/material.dart';

import '../functions/edit_text.dart';
import 'info_row.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  List itemList = [
    {
      'icon': Icons.email,
      'controller': TextEditingController(),
      'editFunction': () {},
      'initialText': 'email'
    },
    {
      'icon': Icons.phone,
      'controller': TextEditingController(),
      'editFunction': () {},
      'initialText': 'phone'
    },
    {
      'icon': Icons.navigation,
      'controller': TextEditingController(),
      'editFunction': () {},
      'initialText': 'address'
    },
    {
      'icon': Icons.person,
      'controller': TextEditingController(),
      'editFunction': () {},
      'initialText': 'fullname'
    }
  ];

  void fillInitialText() {
    itemList[0]['initialText'] = 'Email gelecek';
    itemList[0]['editFunction'] = () => edit(0);

    itemList[1]['initialText'] = 'Telefon gelecek';
    itemList[1]['editFunction'] = () => edit(1);

    itemList[2]['initialText'] = 'Adres gelecek';
    itemList[2]['editFunction'] = () => edit(2);

    itemList[3]['initialText'] = 'İsim gelecek';
    itemList[3]['editFunction'] = () => edit(3);
  }

  @override
  Widget build(BuildContext context) {
    fillInitialText();
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return InfoRow(
          controller: TextEditingController(),
          editFunction: itemList[index]['editFunction'],
          icon: itemList[index]['icon'],
          text: itemList[index]['initialText'],
        );
      },
    );
  }

  Future<void> edit(int index) async {
    var newText = await editText(itemList[index]['initialText'], context);
    setState(() {
      itemList[index]['initialText'] = newText;
    });
  }
}
