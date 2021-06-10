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
    pet = Provider.of<PetProvider>(context, listen: false).getSelectedPet();
    var user = Provider.of<UserProvider>(context, listen: false);
    return Consumer<PetProvider>(
      builder: (ctx, petProv, child) => Scaffold(
        appBar: getAppBar(context, pet!.name, 'detail', func: () async {
          var petProv = Provider.of<PetProvider>(context, listen: false);
          var res = await petProv.addToFav(pet!.id);
          if (res) {
            await user.addToFav(pet!.id);
          }
        }, isFav: user.user.favorites!.contains(pet!.id)),
        body: Padding(
          padding: context.bottomExtreme,
          child: Column(
            children: [
              Expanded(flex: 4, child: getSlidingBar()),
              Expanded(flex: 2, child: getInfoRow()),
              Expanded(flex: 2, child: getSummary()),
              Expanded(flex: 2, child: getContact()),
            ],
          ),
        ),
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
        id: pet!.id,
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
          Expanded(
              child: DetailItem(title: 'gender'.translate, info: pet!.gender)),
          Expanded(
              child: DetailItem(
                  title: 'age'.translate, info: pet!.age.toString())),
          Expanded(
              child: DetailItem(
                  title: 'weight'.translate, info: pet!.weight.toString())),
        ],
      ),
    );
  }

  Widget getSummary() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.width * 6.6,
        vertical: context.height * 1.5,
      ),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('summary'.translate, style: context.headline3),
          SizedBox(
            height: context.height * 1.1,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                pet?.summary ?? '',
                style: context.headline4.copyWith(color: Colors.black54),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getContact() {
    return Container(
      padding: context.horizontalHigh,
      margin: context.topMedium,
      width: double.infinity,
      height: context.height * 14,
      child: ContactPerson(user: pet!.owner!),
    );
  }

  void setIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Future<void> addToFavorites() async {}
}
