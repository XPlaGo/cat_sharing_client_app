import 'package:cat_sharing_client_app/common/money_tools.dart';
import 'package:cat_sharing_client_app/components/buttons/accent_button.dart';
import 'package:cat_sharing_client_app/components/inputs/text_input.dart';
import 'package:cat_sharing_client_app/components/modals/default_bottom_sheet.dart';
import 'package:cat_sharing_client_app/generated/trade.pb.dart';
import 'package:cat_sharing_client_app/services/grpc_tools_service.dart';
import 'package:cat_sharing_client_app/services/trade_service.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:unicons/unicons.dart';

import '../notification/notification_message.dart';

class CreateSaleOfferBottomSheet extends StatefulWidget {

  final int catId;
  final Function(SaleOfferInfo)? onSuccess;
  final Function()? onFailed;

  const CreateSaleOfferBottomSheet({
    super.key,
    required this.catId,
    this.onSuccess,
    this.onFailed,
  });

  @override
  State<StatefulWidget> createState() => CreateSaleOfferBottomSheetState();
}

class CreateSaleOfferBottomSheetState extends State<CreateSaleOfferBottomSheet> {

  TradeService tradeService = GetIt.instance<TradeService>();

  String commentValue = "";
  String priceValue = "";

  Map<String, dynamic>? errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Create sale offer",
              style: Theme.of(context).textTheme.displayMedium,
            )
          ],
        ),
        const SizedBox(height: 16),
        getCommentInput(context),
        const SizedBox(height: 10),
        getPriceInput(context),
        const SizedBox(height: 16),
        getCreateSaleOfferButton(context),
      ],
    );
  }

  Widget getCreateSaleOfferButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CSAccentButton(
            padding: const EdgeInsets.all(16),
            onPressed: (reset) async {
              await createSaleOffer(context);
            },
            text: "Create sale offer",
            prefixIcon: Iconify(
              Uil.plus,
              size: 24,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        )
      ],
    );
  }

  Widget getPriceInput(BuildContext context) {
    return CSTextInput(
      keyboardType: TextInputType.number,
      placeholder: "Price",
      errorText: errors?["price"]?["message"],
      prefixIcon: Icon(
        UniconsLine.money_bill,
        size: 24,
        color: Theme.of(context).textTheme.bodyMedium?.color,
      ),
      onChanged: (value) {
        setState(() {
          priceValue = value;
        });
      },
    );
  }

  Widget getCommentInput(BuildContext context) {
    return CSTextInput(
      keyboardType: TextInputType.multiline,
      placeholder: "Offer comment",
      errorText: errors?["comment"]?["message"],
      prefixIcon: Icon(
        UniconsLine.comment,
        size: 24,
        color: Theme.of(context).textTheme.bodyMedium?.color,
      ),
      onChanged: (value) {
        setState(() {
          commentValue = value;
        });
      },
    );
  }

  Future<void> createSaleOffer(BuildContext context) async {
    try {
      SaleOfferInfo result = await tradeService.createSaleOffer(CreateSaleOfferRequest(
        catId: Int64(widget.catId),
        comment: commentValue,
        price: MoneyTools.fromString(priceValue),
      ));
      showNotificationMessage(context, "Created sale order", status: NotificationMessageStatus.success);
      if (widget.onSuccess != null) widget.onSuccess!(result);
      Navigator.of(context).pop();
    } on GrpcError catch (error) {
      print(error);
      if (widget.onFailed != null) widget.onFailed!();
      if (error.code == Code.INVALID_ARGUMENT.value) {
        setState(() {
          errors = GrpcToolsService.extractErrorsFromTrailers(error);
        });
      } else {
        showNotificationMessage(context, error.message ?? "Grpc error", status: NotificationMessageStatus.error);
        Navigator.of(context).pop();
      }
    }
  }
}

Future<void> showCreateSaleOfferBottomSheet(
    BuildContext context,
    int catId,
{
  Function(SaleOfferInfo)? onSuccess,
  Function()? onFailed
}
    ) {
  return showDefaultBottomSheet(
    context,
    CreateSaleOfferBottomSheet(
      catId: catId,
      onSuccess: onSuccess,
      onFailed: onFailed,
    ),
  );
}