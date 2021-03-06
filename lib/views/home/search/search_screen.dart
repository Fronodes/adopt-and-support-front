import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';
import '../../../core/dummy/dummy_pet.dart';
import '../components/pet_search_item.dart';

typedef OnSearchChanged = Future<List<String>> Function(String);

class Search extends SearchDelegate<Pet> {
  List<Pet> pets;
  final GlobalKey<State> key = GlobalKey<State>();

  Search({required this.pets})
      : super(
            searchFieldLabel: 'search'.translate,
            searchFieldStyle:
                TextStyle(color: Colors.black.withOpacity(.6), fontSize: 18));

  @override
  List<Widget> buildActions(BuildContext context) {
    return query == ''
        ? []
        : [
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                query = '';
              },
            ),
            IconButton(
              padding: context.rightLow,
              icon: Icon(Icons.search),
              onPressed: () async {
                showResults(context);
              },
            )
          ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      padding: context.leftMedium,
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        size: context.width * 7,
      ),
      onPressed: () {
        close(context, getDummyPet());
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var petList = Provider.of<PetProvider>(context, listen: false)
        .pets
        .where((element) =>
            element.province.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => PetSearchItem(
        pet: petList[index],
      ),
      itemCount: petList.length,
      shrinkWrap: true,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = getTurkeyCities()
        .where((element) =>
            element['name'].toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    final petList = Provider.of<PetProvider>(context, listen: false).pets;
    return query.isEmpty
        ? ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => PetSearchItem(
              pet: petList[index],
            ),
            itemCount: petList.length > 5 ? 5 : petList.length,
            shrinkWrap: true,
          )
        : suggestionListBuild(context, suggestionList);
  }

  Padding suggestionListBuild(BuildContext context, suggestionList) {
    return Padding(
      padding: context.horizontalMedium,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => ListTile(
          onTap: () async {
            query = suggestionList[index]['name'];
            showResults(context);
          },
          title: Text(
            suggestionList[index]['name'],
            style: context.headline4.copyWith(
              color: Colors.black54,
              fontSize: context.fontSize * 2.7,
            ),
          ),
        ),
        itemCount: suggestionList.length,
      ),
    );
  }
}
