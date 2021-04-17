import 'package:flutter/material.dart';

import '../../core/core_shelf.dart';

class CreateNewAdopted extends StatefulWidget {
  CreateNewAdopted({Key? key}) : super(key: key);

  @override
  _CreateNewAdoptedState createState() => _CreateNewAdoptedState();
}

class _CreateNewAdoptedState extends State<CreateNewAdopted> {
  final int _stepLength = 5;
  static int _index = 1;
  static Gender? _gender;
  var _tempAgeText = '';
  var _tempWeightText = '';
  late final List _textController;

  @override
  void initState() {
    super.initState();
    _textController = List.generate(4, (index) => TextEditingController());
  }

  @override
  void dispose() {
    for (var item in _textController) {
      item.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context,
        'add_new'.translate,
        icon: IconButton(
            icon: Icon(Icons.close), onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _step(context),
          Expanded(child: _body(context)),
          Padding(
            padding: context.horizontalLow,
            child: _buttons(),
          ),
        ],
      ),
    );
  }

  Widget _step(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.lowPadding,
          child: Text(
            '${'step'.translate}: $_index/$_stepLength ',
            textAlign: TextAlign.left,
            style: context.headline6.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        _stepOrder(context),
      ],
    );
  }

  Widget _body(BuildContext context) {
    switch (_index) {
      case 1:
        return Padding(
          padding: context.horizontalMedium,
          child: Column(
            children: [
              Text('select_category'.translate),
              SizedBox(
                  height: context.height * 20,
                  child: _selectTypeButton(context))
            ],
          ),
        );
      case 2:
        return Padding(
          padding: context.horizontalMedium,
          child: Container(
            alignment: Alignment.topLeft,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                _textFieldEditor(
                    context,
                    _textController[0],
                    _gender == Gender.male
                        ? 'whats_his_name'.translate
                        : 'whats_her_name'.translate,
                    (val) {},
                    (val) {}),
              ],
            ),
          ),
        );
      case 3:
        return Padding(
          padding: context.horizontalMedium,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    _textFieldEditor(
                        context,
                        _textController[1],
                        _gender == Gender.male
                            ? 'whats_his_age'.translate
                            : 'whats_her_age'.translate, (val) {
                      var _demo = '';
                      for (var i = 0; i < val.length; i++) {
                        _demo += ' ';
                      }
                      setState(() {
                        val != ''
                            ? _tempAgeText = '$_demo           year'
                            : _tempAgeText = '';
                      });
                    }, (val) {}),
                    Text(
                      '$_tempAgeText',
                      style: context.headline5,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    _textFieldEditor(
                        context,
                        _textController[2],
                        _gender == Gender.male
                            ? 'whats_his_weight'.translate
                            : 'whats_her_weight'.translate, (val) {
                      var _demo = '';
                      for (var i = 0; i < val.length; i++) {
                        _demo += ' ';
                      }
                      setState(() {
                        val != ''
                            ? _tempWeightText = '$_demo           kg'
                            : _tempWeightText = '';
                      });
                    }, (val) {}),
                    Text(
                      '$_tempWeightText',
                      style: context.headline5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      case 4:
        return Padding(
          padding: context.horizontalMedium,
          child: Container(
            alignment: Alignment.topLeft,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                _textFieldEditor(
                    context,
                    _textController[0],
                    _gender == Gender.male
                        ? 'tell_us_more_about_him'.translate
                        : 'tell_us_more_about_her'.translate,
                    (val) {},
                    (val) {}),
              ],
            ),
          ),
        );

      case 5:
        return Container(
          color: Colors.purpleAccent,
        );
      default:
        throw NotFoundException(
            'The $_index not found. On Create_new_adopted.dart');
    }
  }

  Row _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _index == 1
            ? Container()
            : GestureDetector(
                onTap: () => setState(() => _index--),
                child: Text('go_back'.translate),
              ),
        FloatingActionButton(
          onPressed: () => setState(() => _index++),
          child: Icon(_index == 5 ? Icons.done : Icons.arrow_right_alt),
        ),
      ],
    );
  }

  Row _stepOrder(BuildContext context) {
    var stepList = List.generate(
        5,
        (index) => Expanded(
              child: Padding(
                padding: context.lowPadding,
                child: Container(
                  margin: EdgeInsets.only(right: 5),
                  height: context.height * 1,
                  decoration: BoxDecoration(
                    color: index <= _index - 1
                        ? context.primary
                        : context.disabled,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ));
    return Row(children: stepList);
  }

  Container _selectTypeButton(BuildContext context) {
    return Container();
  }

  TextFormField _textFieldEditor(
      BuildContext context,
      TextEditingController _controller,
      String labelText,
      Function(String) onChange,
      Function(String) onSave) {
    return TextFormField(
      controller: _controller,
      style: context.headline4,
      onChanged: onChange,
      maxLines: null,
      decoration: TextFormDeco.createNewAdopted(context, labelText),
    );
  }
}
