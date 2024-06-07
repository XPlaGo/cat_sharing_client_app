import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:flutter/material.dart';

class DrawerPagesSectionItem {
  final String pageName;
  final String pageRoute;
  final Widget? pageIcon;

  DrawerPagesSectionItem({
    required this.pageName,
    required this.pageRoute,
    this.pageIcon,
  });
}

class DrawerPagesSection extends StatefulWidget {

  final Function(bool) setDrawerState;
  final List<DrawerPagesSectionItem> items;

  const DrawerPagesSection({
    super.key,
    required this.items,
    required this.setDrawerState,
  });

  @override
  State<StatefulWidget> createState() => DrawerPagesSectionState();
}

class DrawerPagesSectionState extends State<DrawerPagesSection> {
  @override
  Widget build(BuildContext context) {

    List<Widget> pagesItems = widget.items.asMap().entries.map((entry) {
      DrawerPagesSectionItem item = entry.value;
      int index = entry.key;

      return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              CSFlatButton(
                showLoader: false,
                  backgroundColor:
                  Theme.of(context).colorScheme.primaryContainer,
                  onPressed: (reset) async {
                    widget.setDrawerState(false);
                    if (mounted && ModalRoute.of(context)?.settings.name != item.pageRoute) {
                      Navigator.of(context).pushNamed(item.pageRoute).then((value) => reset());
                    }
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      item.pageIcon != null
                          ? Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: item.pageIcon,
                      )
                          : const SizedBox(),
                      Text(
                        item.pageName,
                        style: Theme.of(context).textTheme.labelLarge,
                      )
                    ],
                  )),
              index != widget.items.length - 1 ? Divider(
                height: 1,
                color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.1),
              ) : const SizedBox(),
            ],
          ));
    }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: pagesItems,
      )
    );
  }
}
