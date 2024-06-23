import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:cat_sharing_client_app/generated/cat.pb.dart';
import 'package:cat_sharing_client_app/pages/my_cats/cat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icons8.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/uil.dart';

class MyCatsTabs extends StatefulWidget {

  final OwnerInfo? ownerInfo;

  const MyCatsTabs({
    super.key,
    required this.ownerInfo,
  });

  @override
  State<StatefulWidget> createState() => MyCatsTabsState();
}

class MyCatsTabsState extends State<MyCatsTabs> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                  child: CSFlatButton(
                    onPressed: (reset) async {
                      setState(() {
                        _tabController.animateTo(0);
                        _tabController.index = 0;
                      });
                    },
                    prefixIcon: Iconify(
                      Uil.user,
                      size: 18,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                    text: "My",
                    backgroundColor: _tabController.index != 0 ? Theme.of(context).colorScheme.background : null,
                    color: _tabController.index == 0 ? Colors.black : null
                  )
              ),
              const SizedBox(width: 5),
              Expanded(
                  child: CSFlatButton(
                      onPressed: (reset) async {
                        setState(() {
                          _tabController.animateTo(1);
                          _tabController.index = 1;
                        });
                      },
                      prefixIcon: Iconify(
                        Mdi.handshake_outline,
                        size: 18,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                      text: "Rented",
                      backgroundColor: _tabController.index != 1 ? Theme.of(context).colorScheme.background : null,
                      color: _tabController.index == 1 ? Colors.black : null
                  )
              ),
            ],
          ),
        ),
        Expanded(
          child: ScrollShadow(
            color: Theme.of(context).colorScheme.background,
            size: 16,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                getTabBody(context, widget.ownerInfo?.catsIds.map((e) => e.toInt()).toList()),
                getTabBody(context, widget.ownerInfo?.rentedCatsIds.map((e) => e.toInt()).toList()),
              ],
            ),
          )
        )
      ],
    );
  }

  Widget getTabBody(BuildContext context, List<int>? catsIds) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Container(
        child: catsIds == null || catsIds.isEmpty ?
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Iconify(
                      Icons8.cat_footprint,
                      size: 48,
                      color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
                    ),
                    const SizedBox(height: 5),
                    Text(
                        "No cats",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5)
                      ),
                    ),
                  ],
                ),
              ),
            ) :
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ScrollShadow(
                color: Theme.of(context).colorScheme.background,
                size: 32,
                child: ListView.builder(
                    itemCount: catsIds.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CatCard(catId: catsIds[index]);
                    }
                ),
              ),
            )
      ),
    );
  }
}