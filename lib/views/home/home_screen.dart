import 'package:flutter/material.dart';

import '../../core/core_shelf.dart';
import '../../core/dummy/dummy_pet.dart';
import 'components/components_shelf.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> selectedItems = ['cats'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, 'home_screen'.translate),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: context.horizontalMedium,
        child: getColumn(),
      ),
    );
  }

  Widget getColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getTitle(),
        SearchBar(onPress: showSearchHelper),
        getTypeRow(),
        getPetRow(),
        getPets(),
        SizedBox(height: context.height * 2),
        Container(
          height: context.height * 15,
          margin: context.horizontalMedium,
          child: DonateUs(),
        ),
      ],
    );
  }

  Widget getTypeRow() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 2,
        vertical: context.height * 2.4,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => select('cats'),
            child: TypeItem(
              imagePath: 'cat'.toSVG,
              title: 'cats'.translate,
              isSelected: selectedItems.contains('cats'),
            ),
          ),
          SizedBox(width: context.width * 5),
          InkWell(
            onTap: () => select('dogs'),
            child: TypeItem(
              imagePath: 'dog'.toSVG,
              title: 'dogs'.translate,
              isSelected: selectedItems.contains('dogs'),
            ),
          )
        ],
      ),
    );
  }

  Widget getPetRow() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 2,
        vertical: context.height * 1.2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'friends'.translate,
            style: context.headline3.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: context.fontSize * 3.3,
            ),
          ),
          Text(
            'see_all'.translate,
            style: context.headline4.copyWith(color: Colors.black38),
          )
        ],
      ),
    );
  }

  Widget getPets() {
    return Container(
      height: context.height * 22,
      margin:
          EdgeInsets.only(left: context.width * 3, top: context.height * 1.4),
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return PetItem(pet: getDummyPet());
        },
      ),
    );
  }

  Widget getTitle() {
    return Padding(
      padding: EdgeInsets.only(
        left: context.width * 1.3,
        top: context.height * 3,
        bottom: context.height * 2,
      ),
      child: Text(
        'home_title'.translate,
        style: context.headline1.copyWith(
          fontWeight: FontWeight.w800,
          color: Colors.black.withOpacity(.75),
          letterSpacing: 2.2,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }

  Future<void> showSearchHelper() async {
    final petList = Provider.of<PetProvider>(context, listen: false).pets;
    await showSearch<Pet>(
      context: context,
      delegate: Search(pets: petList),
    );
  }

  void select(String type) {
    setState(() {
      if (selectedItems.contains(type)) {
        selectedItems.remove(type);
      } else {
        selectedItems.add(type);
      }
    });
  }
}
