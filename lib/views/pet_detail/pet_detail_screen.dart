import 'package:flutter/material.dart';

import '../../core/core_shelf.dart';
import './components/components_shelf.dart';

class PetDetailScreen extends StatefulWidget {
  @override
  _PetDetailScreenState createState() => _PetDetailScreenState();
}

class _PetDetailScreenState extends State<PetDetailScreen> {
  Pet? pet;
  final PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    pet = Provider.of<PetProvider>(context).getSelectedPet();
    return Scaffold(
      appBar: getAppBar(context, pet!.name, 'detail'),
      body: Column(
        children: [
          getSlidingBar(),
          getInfoRow(),
          getSummary(),
          getContact(),
        ],
      ),
    );
  }

  Widget getSlidingBar() {
    return Container(
      height: context.height * 36,
      child: SlidingPage(
        func: setIndex,
        controller: controller,
        photoUrls: pet!.photoUrls,
        currentIndex: currentIndex,
      ),
    );
  }

  Widget getInfoRow() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 3.5, vertical: context.height * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: DetailItem(title: 'gender'.translate, info: 'Male')),
          Expanded(child: DetailItem(title: 'age'.translate, info: '2')),
          Expanded(child: DetailItem(title: 'weight'.translate, info: '3.5kg')),
        ],
      ),
    );
  }

  Widget getSummary() {
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
            pet!.summary,
            style: context.headline4.copyWith(color: Colors.black54),
          )
        ],
      ),
    );
  }

  Widget getContact() {
    return Container(
      padding: context.horizontalHigh,
      margin: context.topHigh,
      width: double.infinity,
      height: context.height * 14,
      child: ContactPerson(
        user: User(
          '2',
          'Person',
          '10310321',
          Address('cadde', 'mahalle', 'fatih', 'istanbul'),
          'mail.com',
          'https://lh3.googleusercontent.com/proxy/WuRYekBXXGwia0qeZJ_8cOVXVwdLbeLO8NFPmgmYWmQlCO7G_8kI6R7rxt9cYOJn-8WFPA6wSEMIBKVRcvg6RiDQgVu_LfBxBPZZthFhO2CdBqmeCl56oQ',
          [],
        ),
      ),
    );
  }

  void setIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Future<void> addToFavorites() async {}
}
