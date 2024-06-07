import 'package:cat_sharing_client_app/components/drawers/sections/drawer_pages_section.dart';
import 'package:cat_sharing_client_app/components/drawers/sections/drawer_profile_section.dart';
import 'package:cat_sharing_client_app/components/drawers/sections/drawer_tools_section.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart' as unicons;

class DefaultDrawer extends StatefulWidget {
  final Function(bool) setDrawerState;

  const DefaultDrawer({super.key, required this.setDrawerState});

  @override
  State<StatefulWidget> createState() => DefaultDrawerState();
}

class DefaultDrawerState extends State<DefaultDrawer> {
  List<DrawerPagesSectionItem> getPageItems(BuildContext context) {
    return [
      DrawerPagesSectionItem(
        pageName: "Home",
        pageRoute: "/",
        pageIcon: Icon(
          unicons.UniconsLine.home_alt,
          size: 24,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
      DrawerPagesSectionItem(
          pageName: "My cats",
          pageRoute: "/mycats",
        pageIcon: Icon(
          unicons.UniconsLine.smile,
          size: 24,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
    ];
  }

  List<DrawerToolsSectionItem> getToolsItems(BuildContext context) {
    return [
      DrawerToolsSectionItem(
        itemName: "About",
        itemRoute: "/about",
        itemIcon: Icon(
          unicons.UniconsLine.info_circle,
          size: 24,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
      DrawerToolsSectionItem(
        itemName: "Settings",
        itemRoute: "/settings",
        itemIcon: Icon(
          unicons.UniconsLine.setting,
          size: 24,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              children: [
                DrawerProfileSection(
                    setDrawerState: widget.setDrawerState
                ),
                DrawerPagesSection(
                    items: getPageItems(context),
                    setDrawerState: widget.setDrawerState
                ),
                const Spacer(),
                DrawerToolsSection(
                  items: getToolsItems(context),
                  setDrawerState: widget.setDrawerState,
                ),
              ],
            ),
          ),
        ));
  }
}
