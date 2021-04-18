part of '../create_new_adopted.dart';

Padding _imageSection(BuildContext context, Widget errorWidget, List<File> item,
    Function(File) onPressed) {
  var tmpList = [
    ...item.map((item) => Padding(
        padding: context.mediumPadding,
        child: ClipRRect(
          child: getImage(item),
        ))),
    Padding(
      padding: context.mediumPadding,
      child: AddImageLargeButton(onPressed: onPressed),
    ),
  ];
  return Padding(
    padding: context.horizontalMedium,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('add_some_photo'.translate, style: context.headline4),
        errorWidget,
        Expanded(
          child: LayoutBuilder(
            builder: (ctx, cntrnts) => GridView.count(
              crossAxisCount: 2,
              childAspectRatio: cntrnts.biggest.aspectRatio * 4 / 2,
              children: tmpList,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget getImage(File item) => kIsWeb
    ? Image.network(
        item.path,
        fit: BoxFit.fill,
      )
    : Image.file(File(item.path), fit: BoxFit.fill);
