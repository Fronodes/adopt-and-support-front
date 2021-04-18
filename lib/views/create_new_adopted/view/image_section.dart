part of '../create_new_adopted.dart';

Padding _imageSection(BuildContext context, Widget errorWidget, List<File> item,
    Function(File) onPressed) {
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

            var _file = kIsWeb
                ? File(source!.path)
                : await ImageCropper.cropImage(
                    sourcePath: source!.path,
                    aspectRatioPresets: [
                      CropAspectRatioPreset.ratio3x2,
                    ],
                    androidUiSettings: AndroidUiSettings(
                        toolbarTitle: 'Cropper',
                        toolbarColor: Colors.deepOrange,
                        toolbarWidgetColor: Colors.white,
                        lockAspectRatio: false),
                    iosUiSettings: IOSUiSettings(
                      minimumAspectRatio: 1.0,
                    ));

            if (_file != null) {
              onPressed(_file);
            }
          },
          child: Container(child: Icon(Icons.add, color: context.primary))),
    )
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
