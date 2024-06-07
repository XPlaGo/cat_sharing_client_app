import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cat_sharing_client_app/components/pages/faded_page.dart';
import 'package:cat_sharing_client_app/pages/settings/settings_section.dart';
import 'package:cat_sharing_client_app/pages/settings/settings_toggle_item.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return FadedPage(
      getAppBarChild: getAppBarChild,
      getChild: getChild,
    );
  }

  Widget getChild(Function() goBack) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [
                SettingsSection(
                  sectionName: "Personalization", items: [
                    SettingsToggleItem(
                        itemName: "Dark mode",
                        value: Theme.of(context).brightness == Brightness.dark,
                        setValue: (bool state) {
                          print(state);
                          if (state) {
                            AdaptiveTheme.of(context).setDark();
                          } else {
                            AdaptiveTheme.of(context).setLight();
                          }
                        })
                ],
                )
              ],
            ),
          ),
        )
      ],),
    );
  }

  Widget getAppBarChild(Function() goBack) {
    return Text("Settings", style: Theme.of(context).textTheme.titleMedium);
  }
}