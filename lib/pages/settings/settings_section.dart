import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:unicons/unicons.dart' as unicons;

class SettingsSection extends StatefulWidget {

  final String sectionName;
  final List<Widget> items;

  const SettingsSection({
    super.key,
    required this.sectionName,
    required this.items,
  });

  @override
  State<StatefulWidget> createState() => SettingsSectionState();
}

class SettingsSectionState extends State<SettingsSection> {
  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      theme: ExpandableThemeData(
        iconPlacement: ExpandablePanelIconPlacement.left,
        iconPadding: const EdgeInsets.all(5),
        iconSize: 18,
        iconColor: Theme.of(context).textTheme.bodyMedium?.color,
        expandIcon: unicons.UniconsLine.angle_down,
        collapseIcon: unicons.UniconsLine.angle_down,
      ),
      header: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Text(
            widget.sectionName,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(height: 1)
        ),
      ),
      expanded: Padding(
        padding: const EdgeInsets.fromLTRB(24, 5, 5, 5),
        child: Column(
          children: widget.items,
        ),
      ),
      collapsed: const SizedBox(),
    );
  }
}