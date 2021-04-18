part of '../create_new_adopted.dart';

Column preview(
    BuildContext context,
    Gender gender,
    String age,
    String weight,
    String summary,
    int currentIndex,
    List<File> imgFiles,
    Function(int) setIndex) {
  var controller = PageController();

  return Column(
    children: [
      Expanded(
        flex: 2,
        child: getSlidingBar(
          context,
          currentIndex,
          imgFiles,
          setIndex,
          controller,
        ),
      ),
      Expanded(child: getInfoRow(context, gender.toStr, age, weight)),
      Expanded(child: getSummary(context, summary))
    ],
  );
}

Widget getSlidingBar(BuildContext context, int currentIndex,
    List<File> imgFiles, Function(int) setIndex, PageController controller) {
  var tempList = imgFiles.map((e) => e.path).toList();
  return Container(
    height: context.height * 36,
    child: SlidingPage(
      type: 'preview',
      func: setIndex,
      controller: controller,
      photoUrls: tempList,
      currentIndex: currentIndex,
    ),
  );
}

Widget getInfoRow(
    BuildContext context, String gender, String age, String weight) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: context.width * 3.5, vertical: context.height * 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: DetailItem(title: 'gender'.translate, info: gender)),
        Expanded(
            child: DetailItem(title: 'age'.translate, info: age.toString())),
        Expanded(
            child:
                DetailItem(title: 'weight'.translate, info: weight.toString())),
      ],
    ),
  );
}

Widget getSummary(BuildContext context, String summary) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: context.width * 6.6,
      vertical: context.height * 1.3,
    ),
    constraints: BoxConstraints(maxHeight: context.height * 9),
    alignment: Alignment.centerLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('summary'.translate, style: context.headline3),
        SizedBox(
          height: context.height * 1.1,
        ),
        Text(
          summary,
          style: context.headline4.copyWith(color: Colors.black54),
        )
      ],
    ),
  );
}
