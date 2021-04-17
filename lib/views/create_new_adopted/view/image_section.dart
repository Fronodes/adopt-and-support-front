part of '../create_new_adopted.dart';

LayoutBuilder _imageSection(BuildContext context, Widget errorWidget,
    List<File> item, Function(File) onPressed) {
  var _picker = ImagePicker();

  var tmpList = [
    ...item.map((item) => Padding(
        padding: context.mediumPadding,
        child: ClipRRect(
          child: getImage(item),
        ))),
    Padding(
      padding: context.mediumPadding,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: context.canvas),
          onPressed: () async {
            var source = await _picker.getImage(source: ImageSource.gallery);
            var _file = File(source!.path);
            onPressed(_file);
          },
          child: Container(child: Icon(Icons.add, color: context.primary))),
    )
  ];
  return LayoutBuilder(
    builder: (ctx, cntrnts) => GridView.count(
      crossAxisCount: 2,
      childAspectRatio: cntrnts.biggest.aspectRatio * 4 / 2,
      children: tmpList,
    ),
  );
}

Widget getImage(File item) => kIsWeb
    ? Image.network(
        item.path,
        fit: BoxFit.fill,
      )
    : Image.file(File(item.path), fit: BoxFit.fill);
