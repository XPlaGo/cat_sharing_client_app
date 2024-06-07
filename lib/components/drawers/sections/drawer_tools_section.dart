import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:flutter/material.dart';

class DrawerToolsSectionItem {
  final String itemName;
  final String itemRoute;
  final Widget? itemIcon;

  DrawerToolsSectionItem(
      {required this.itemName,
      required this.itemRoute,
      required this.itemIcon});
}

class DrawerToolsSection extends StatefulWidget {

  final Function(bool) setDrawerState;
  final List<DrawerToolsSectionItem> items;

  const DrawerToolsSection({
    super.key,
    required this.items,
    required this.setDrawerState
  });

  @override
  State<StatefulWidget> createState() => DrawerToolsSectionState();
}

class DrawerToolsSectionState extends State<DrawerToolsSection> {
  @override
  Widget build(BuildContext context) {
    List<Widget> toolsItems = widget.items.asMap().entries.map((entry) {
      DrawerToolsSectionItem item = entry.value;
      int index = entry.key;

      return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              CSFlatButton(
                  showLoader: false,
                  backgroundColor:
                      Theme.of(context).colorScheme.background,
                  onPressed: (reset) async {
                    widget.setDrawerState(false);
                    if (mounted && ModalRoute.of(context)?.settings.name != item.itemRoute) {
                      Navigator.of(context).pushNamed(item.itemRoute).then((value) => reset());
                    }
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      item.itemIcon != null
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: item.itemIcon,
                            )
                          : const SizedBox(),
                      Text(
                        item.itemName,
                        style: Theme.of(context).textTheme.labelLarge,
                      )
                    ],
                  )),
              index != widget.items.length - 1 ? Divider(
                height: 1,
                color: Theme.of(context).colorScheme.primaryContainer,
              ) : const SizedBox(),
            ],
          ));
    }).toList();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: toolsItems,
          )),
    );
  }
}
