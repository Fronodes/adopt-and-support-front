import 'package:adopet/core/core_shelf.dart';
import 'package:adopet/core/provider/provider_shelf.dart';
import 'package:flutter/material.dart';

import '../functions/edit_text.dart';
import 'info_row.dart';

class InfoScreen extends StatefulWidget {
  final User user;

  const InfoScreen({Key? key, required this.user}) : super(key: key);
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  List itemList = [];
  @override
  void initState() {
    super.initState();
    itemList = [
      {
        'icon': Icons.email,
        'controller': TextEditingController(text: widget.user.email),
        'editFunction': () {},
        'initialText': 'email'
      },
      {
        'icon': Icons.phone,
        'controller': TextEditingController(text: widget.user.phoneNumber),
        'editFunction': () {},
        'initialText': 'phone'
      },
      {
        'icon': Icons.person,
        'controller': TextEditingController(text: widget.user.fullName),
        'editFunction': () {},
        'initialText': 'fullname'
      }
    ];
    itemList[0]['initialText'] = '${widget.user.email}';
    itemList[0]['editFunction'] = () => edit(0, context);

    itemList[1]['initialText'] = '${widget.user.phoneNumber ?? ''}';
    itemList[1]['editFunction'] = () => edit(1, context);

    itemList[2]['initialText'] = '${widget.user.fullName}';
    itemList[2]['editFunction'] = () => edit(2, context);
  }

  @override
  Widget build(BuildContext context) {
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

  Future<void> edit(int index, BuildContext ctx) async {
    var newText = await editText(itemList[index]['initialText'], ctx);
    setState(() {
      itemList[index]['initialText'] = newText;
    });
    print(itemList[index]['initialText']);
  }
}
