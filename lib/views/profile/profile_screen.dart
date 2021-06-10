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
  late User user;
  TabController? tabController;
  List<Tab> tabList = [];

  @override
  void initState() {
    super.initState();
    user = Provider.of<UserProvider>(context, listen: false).user;
    tabController = TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    fillTabList();
    return Consumer<UserProvider>(
      builder: (ctx, up, child) => Scaffold(
        body: Container(
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
        ),
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
          image: 'https://f682c61e0edc.ngrok.io${user.photoUrl}',
        ),
      ),
    );
  }

  Widget getNameMail(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${user.fullName}',
          style: context.headline4.copyWith(
            color: Colors.black.withOpacity(.65),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.height * .8),
        Text(
          '${user.email}',
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
    final petList = Provider.of<PetProvider>(context, listen: false)
        .pets
        .where((element) => element.owner!.id == user.id)
        .toList();
    final favPets = user.favorites == null || user.favorites!.isEmpty
        ? []
        : Provider.of<PetProvider>(context, listen: false)
            .pets
            .where((element) => user.favorites!.contains(element.id))
            .toList();
    print('dfsdf');
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
          InfoScreen(
            user: user,
          ),
          Padding(
            padding: context.topMedium,
            child: favPets.isEmpty
                ? Center(child: Text('You have not favorite pet'))
                : CustomGridView(
                    list: favPets,
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
