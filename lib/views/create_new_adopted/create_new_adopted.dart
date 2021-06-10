import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/core_shelf.dart';
import '../home/components/type_item.dart';
import '../pet_detail/components/detail_item.dart';

part 'layout/button_widget.dart';
part 'layout/error_text_widget.dart';
part 'layout/selected_gender_widget.dart';
part 'layout/selected_type_widget.dart';
part 'layout/step_order_widget.dart';
part 'layout/step_widget.dart';
part 'layout/text_field_widget.dart';
part 'view/age_and_weight_section.dart';
part 'view/gender_and_type_section.dart';
part 'view/image_section.dart';
part 'view/name_section.dart';
part 'view/preview_section.dart';
part 'view/summary_section.dart';

class CreateNewAdopted extends StatefulWidget {
  CreateNewAdopted({Key? key}) : super(key: key);

  @override
  _CreateNewAdoptedState createState() => _CreateNewAdoptedState();
}

class _CreateNewAdoptedState extends State<CreateNewAdopted> {
  final int _stepLength = 5;
  static int _index = 1;
  static int _slidingIndex = 0;
  static Gender? _gender;
  var _tempAgeText = '';
  var _tempWeightText = '';
  var _errorText = '';
  final _imageFiles = <File>[];
  late final List _textController;

  String _selectedType = '';

  void selectType(String type) {
    setState(() => _selectedType = type);
  }

  void selectGender(Gender gender) {
    setState(() => _gender = gender);
  }

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
      appBar: getAppBar(context,
          _index == 6 ? 'preview'.translate : 'add_new'.translate, 'close'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_index != 6)
              ...{
                _step(context, _index, _stepLength),
                Expanded(child: _body(context)),
              }.toList(),
            if (_index == 6)
              Expanded(
                child: preview(
                    context,
                    _gender!,
                    _textController[1].text,
                    _textController[2].text,
                    _textController[3].text,
                    _slidingIndex,
                    _imageFiles,
                    (val) => setState(() => _slidingIndex = val)),
              ),
            Padding(
              padding: context.mediumPadding,
              child: _buttons(context, _index, _goBack, onSave),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    switch (_index) {
      case 1:
        return _genderAndTypeSection(
            context,
            getErrorWidget(context, _errorText),
            _errorText,
            _selectedType,
            _gender,
            (type) => setState(() => _selectedType = type),
            (gender) => setState(() => _gender = gender));
      case 2:
        return _nameSection(
            context,
            getErrorWidget(context, _errorText),
            _gender == Gender.male
                ? 'whats_his_name'.translate
                : 'whats_her_name'.translate,
            _errorText,
            _textController[0],
            onSave);
      case 3:
        return _ageAndWeightSection(
            context,
            _gender == Gender.male
                ? 'whats_his_age'.translate
                : 'whats_her_age'.translate,
            _gender == Gender.male
                ? 'whats_his_weight'.translate
                : 'whats_her_weight'.translate,
            _tempAgeText,
            _tempWeightText,
            getErrorWidget(context, _errorText),
            _textController[1],
            _textController[2],
            _onAgeChange,
            _onWeightChange,
            onSave);
      case 4:
        return _summarySection(
            context,
            _gender == Gender.male
                ? 'tell_us_more_about_him'.translate
                : 'tell_us_more_about_her'.translate,
            getErrorWidget(context, _errorText),
            _textController[3],
            (val) => null,
            onSave);
      case 5:
        return _imageSection(context, getErrorWidget(context, _errorText),
            _imageFiles, (val) => setState(() => _imageFiles.add(val)));
      default:
        throw NotFoundException(
            'The $_index not found. On Create_new_adopted.dart');
    }
  }

  void onSave(val) {
    setState(() {
      if (_index == 1 && _gender != null && _selectedType != '') {
        _index++;
        _errorText = '';
      } else if (_index == 2 && _textController[0].text != '') {
        _index++;
        _errorText = '';
      } else if (_index == 3 &&
          _textController[1].text != '' &&
          _textController[2].text != '') {
        _index++;
        _errorText = '';
      } else if (_index == 4 && _textController[3].text != '') {
        _index++;
        _errorText = '';
      } else if (_index == 5 && _imageFiles.isNotEmpty) {
        _index++;
        _errorText = '';
      } else if (_index == 6) {
        NavigationService.instance.pop();
      } else {
        _errorText = 'fill_all_required'.translate;
      }
    });
  }

  void _onWeightChange(val) {
    var _demo = '';
    for (var i = 0; i < val.length; i++) {
      _demo += ' ';
    }
    setState(() {
      val != ''
          ? _tempWeightText = '$_demo           kg'
          : _tempWeightText = '';
    });
  }

  void _onAgeChange(val) {
    var _demo = '';
    for (var i = 0; i < val.length; i++) {
      _demo += ' ';
    }
    setState(() {
      val != '' ? _tempAgeText = '$_demo           year' : _tempAgeText = '';
    });
  }

  void _goBack() => setState(() => _index--);
}
