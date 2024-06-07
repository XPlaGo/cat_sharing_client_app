import 'package:cat_sharing_client_app/components/drawers/default_drawer.dart';
import 'package:cat_sharing_client_app/components/pages/page_with_drawer.dart';
import 'package:cat_sharing_client_app/pages/home/sections/actions/actions_section.dart';
import 'package:cat_sharing_client_app/pages/home/sections/search/search_section.dart';
import 'package:flutter/material.dart';
import 'package:cat_sharing_client_app/pages/home/header/home_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageWithDrawer(
      getDrawerChild: getDrawerChild,
      getPageChild: getPageChild,
    );
  }

  Widget getDrawerChild(bool isDrawerOpened, Function(bool) setDrawerState) {
    return SafeArea(child: DefaultDrawer(setDrawerState: setDrawerState));
  }

  Widget getPageChild(bool isDrawerOpened, Function(bool) setDrawerState) {
    return SafeArea(child: Column(
      children: [
        HomeHeader(
            isDrawerOpened: isDrawerOpened,
            setDrawerState: setDrawerState
        ),
        const SearchSection(),
        const ActionsSection(),
      ],
    ));
  }
}
