part of '../create_new_adopted.dart';
Column _step(BuildContext context, _index, _stepLength) {
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
        _stepOrder(context, _index),
      ],
    );
  }