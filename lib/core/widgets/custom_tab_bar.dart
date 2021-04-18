import 'package:flutter/material.dart';

import '../core_shelf.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Tab> tabList;
  const CustomTabBar({required this.tabController, required this.tabList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white.withOpacity(.9)),
      child: TabBar(
        controller: tabController,
        indicatorColor: context.primary.withOpacity(.85),
        indicatorWeight: 2.5,
        labelColor: context.primary,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: Colors.black26,
        tabs: tabList,
      ),
    );
  }
}
