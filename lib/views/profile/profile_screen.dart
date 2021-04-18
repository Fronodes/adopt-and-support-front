import 'package:flutter/material.dart';

import '../.././core/core_shelf.dart';
import '../../core/dummy/dummy_pet.dart';
import 'components/info_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  List<Tab> tabList = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    fillTabList();
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: context.height * 4),
      child: Column(
        children: [
          Expanded(flex: 6, child: getPhoto(context)),
          Expanded(flex: 3, child: getNameMail(context)),
          Expanded(flex: 3, child: getRoundedButton(context)),
          Expanded(flex: 22, child: getBottomCard(context))
        ],
      ),
    );
  }

  Widget getPhoto(BuildContext context) {
    return CircleAvatar(
      radius: context.width * 14,
      child: ClipOval(
        child: FadeInImage.assetNetwork(
          placeholder: 'loading'.gifPath,
          width: context.width * 48,
          fit: BoxFit.cover,
          image:
              'https://media-exp1.licdn.com/dms/image/C4E03AQHU6Ezgwi0C-g/profile-displayphoto-shrink_200_200/0/1606736684620?e=1622073600&v=beta&t=NrOzkhzr7ha8lKPyvZifiiVVXp_4qPPT_NyAKRIlPOM',
        ),
      ),
    );
  }

  Widget getNameMail(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Bahrican Yeşil',
          style: context.headline4.copyWith(
            color: Colors.black.withOpacity(.65),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.height * .8),
        Text(
          'bahricanyesil',
          style: context.headline6.copyWith(color: Colors.black45),
        )
      ],
    );
  }

  Widget getRoundedButton(BuildContext context) {
    return Container(
      padding: context.lowPadding,
      width: context.width * 45,
      child: RoundedButton(
        radius: BorderRadius.circular(context.width * 20),
        onPressed: editProfile,
        text: 'edit_profile'.translate,
      ),
    );
  }

  Widget getBottomCard(BuildContext context) {
    return Container(
      margin: context.topHigh,
      width: context.width * 90,
      padding: context.mediumPadding,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          CustomTabBar(
            tabController: tabController!,
            tabList: tabList,
          ),
          getTabBarView(context)
        ],
      ),
    );
  }

  Widget getTabBarView(BuildContext context) {
    List<Pet> petList = [];
    for (var i = 0; i < 2; i++) {
      var pet = getDummyPet();
      pet.id = i.toString();
      petList.add(pet);
    }
    return Expanded(
      child: TabBarView(
        physics: BouncingScrollPhysics(),
        controller: tabController,
        children: [
          Padding(
            padding: context.topMedium,
            child: CustomGridView(
              list: petList,
              type: 'adopt',
            ),
          ),
          InfoScreen(),
          Padding(
            padding: context.topMedium,
            child: CustomGridView(
              list: petList,
              type: 'pet',
            ),
          ),
        ],
      ),
    );
  }

  void editProfile() {
    setState(() {
      tabController!.animateTo(1);
    });
  }

  void fillTabList() {
    tabList = [
      Tab(child: Text('adoption_posts'.translate)),
      Tab(child: Text('info'.translate)),
      Tab(child: Text('favorites'.translate))
    ];
  }
}
