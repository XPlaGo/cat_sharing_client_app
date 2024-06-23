import 'package:cat_sharing_client_app/components/modals/default_bottom_sheet.dart';
import 'package:cat_sharing_client_app/pages/my_cats/create_cat_bottom.dart';
import 'package:cat_sharing_client_app/pages/sale_offers/sale_offers_page.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/uil.dart';

import '../../components/buttons/flat_button.dart';

class AddCatBottom extends StatefulWidget {

  final Future<void> Function() refresh;

  const AddCatBottom({
    super.key,
    required this.refresh,
  });

  @override
  State<StatefulWidget> createState() => AddCatBottomBottomState();
}

class AddCatBottomBottomState extends State<AddCatBottom> {

  String nameValue = "";
  DateTime? birthdayValue;

  Map<String, dynamic>? errors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(child: getArendButton(context)),
                const SizedBox(width: 5),
                Expanded(child: getBuyButton(context)),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(child: getCreateButton(context))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getArendButton(BuildContext context) {
    return CSFlatButton(
      loaderSize: 24,
      onPressed: (reset) async {

      },
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      prefixIcon: Iconify(
        Mdi.handshake_outline,
        size: 24,
        color: Theme.of(context).textTheme.bodyMedium?.color,
      ),
      text: "Arend",
    );
  }

  Widget getBuyButton(BuildContext context) {
    return CSFlatButton(
      loaderSize: 24,
      onPressed: (reset) async {
        Navigator.of(context).pushNamed(SaleOffersPage.pageRoute).then((value) => reset());
      },
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      prefixIcon: Iconify(
        Uil.money_bill,
        size: 24,
        color: Theme.of(context).textTheme.bodyMedium?.color,
      ),
      text: "Buy",
    );
  }

  Widget getCreateButton(BuildContext context) {
    return CSFlatButton(
      loaderSize: 24,
      onPressed: (reset) async {
        await showCreateCatModal(context);
      },
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      prefixIcon: Iconify(
        Uil.plus,
        size: 24,
        color: Theme.of(context).textTheme.bodyMedium?.color,
      ),
      text: "Add",
    );
  }

  Future<void> showCreateCatModal(BuildContext context) async {
    Navigator.of(context).pop();
    await showDefaultBottomSheet(context, CreateCatBottom(
      refreshData: () async {
        await widget.refresh();
      },
    ));
  }
}