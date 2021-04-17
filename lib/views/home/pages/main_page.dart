import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';
import '../../../core/dummy/dummy_pet.dart';
import '../components/components_shelf.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> selectedItems = ['cats'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalMedium,
      child: getColumn(),
    );
  }

  Widget getColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.height * 3),
        SearchBar(onPress: showSearchHelper),
        getTypeRow(),
        getPetRow(),
        getPets(),
        SizedBox(height: context.height * .7),
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
        vertical: context.height * 2.6,
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
        vertical: context.height * .5,
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
          TextButton(
            onPressed: () => NavigationService.instance
                .navigateToPage(path: NavigationConstants.viewAll),
            child: Text(
              'see_all'.translate,
              style: context.headline4.copyWith(color: Colors.black38),
            ),
          )
        ],
      ),
    );
  }

  Widget getPets() {
    return Container(
      height: context.height * 24,
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
