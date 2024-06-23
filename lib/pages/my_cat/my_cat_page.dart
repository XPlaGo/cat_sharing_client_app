import 'dart:async';
import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:cat_sharing_client_app/common/money_tools.dart';
import 'package:cat_sharing_client_app/components/buttons/accent_button.dart';
import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:cat_sharing_client_app/components/modals/create_sale_offer_bottom_sheet.dart';
import 'package:cat_sharing_client_app/components/notification/notification_message.dart';
import 'package:cat_sharing_client_app/components/pages/default_page.dart';
import 'package:cat_sharing_client_app/components/skeletons/default_skeleton.dart';
import 'package:cat_sharing_client_app/components/text/overflow_scrollable_text.dart';
import 'package:cat_sharing_client_app/generated/cat.pb.dart';
import 'package:cat_sharing_client_app/generated/payment.pb.dart';
import 'package:cat_sharing_client_app/generated/trade.pb.dart';
import 'package:cat_sharing_client_app/pages/offer_page/offer_page.dart';
import 'package:cat_sharing_client_app/services/cat_service.dart';
import 'package:cat_sharing_client_app/services/trade_service.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyCatPageArguments {
  final int catId;

  MyCatPageArguments({
    required this.catId
  });
}

class MyCatPage extends StatefulWidget {

  const MyCatPage({super.key});

  @override
  State<StatefulWidget> createState() => MyCatPageState();
}

class MyCatPageState extends State<MyCatPage> with AfterLayoutMixin<MyCatPage> {

  CatService catService = GetIt.instance<CatService>();
  TradeService tradeService = GetIt.instance<TradeService>();

  CatInfo? catInfo;
  SaleOfferInfo? saleOfferInfo;
  bool isSaleOfferLoading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      getAppBarChild: getAppBarChild,
      getChild: getChild,
    );
  }

  Widget getAppBarChild(Function() goBack) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: CSSkeleton(
          containersColor: Theme.of(context).colorScheme.primaryContainer,
          enabled: catInfo == null,
          child: Row(
            children: [Text(
              catInfo?.name ?? "",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.left,
            )],
          ),
        )
    );
  }

  Widget getChild(Function() goBack) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: CSSkeleton(
        enabled: catInfo == null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Skeleton.shade(
              child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image(image: AssetImage("assets/avatar/${catInfo?.avatarId ?? "avatar1"}.png"))
              ),
            ),
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getInfoPanel(context),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: getSaleOfferPanel(context)),
                    const SizedBox(width: 10),
                    Expanded(child: getSaleOfferPanel(context)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CSFlatButton(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                        onPressed: (reset) async {},
                        text: "Delete cat",
                        textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.error
                        ),
                        prefixIcon: Iconify(
                          Uil.trash,
                          size: 24,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getInfoPanel(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: OverflowScrollableText(
                    value: catInfo?.name ?? "",
                    textStyle: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Divider(color: Theme.of(context).dividerColor.withOpacity(0.1),),
                Row(
                  children: [
                    const Text("Birthday:"),
                    const Spacer(),
                    Text(catInfo?.birthday != null ? DateFormat("d MMMM y").format(catInfo!.birthday.toDateTime()) : ""),
                  ],
                )
              ],
            ),
          )
        ],
      )
    );
  }

  Widget getSaleOfferPanel(BuildContext context) {
    return CSSkeleton(
      enabled: isSaleOfferLoading,
      containersColor: Theme.of(context).colorScheme.primaryContainer,
      child: saleOfferInfo == null ?
          CSFlatButton(
            showLoader: false,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            onPressed: (reset) async {
              await createSaleOffer(context);
            },
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Sell",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary
                    ),
                  ),
                ),
                Iconify(
                  Uil.arrow_up_right,
                  size: 24,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ],
            ),
          ) :
          CSFlatButton(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            onPressed: (reset) async {
              if (saleOfferInfo != null) {
                Navigator.of(context).pushNamed(OfferPage.pageRoute, arguments: OfferPageArguments(offerId: saleOfferInfo?.id ?? ""));
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0, bottom: 5),
                      child: Text(
                        "On sale",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    getPriceBox(context, saleOfferInfo!.price)
                  ],
                ),
                const Spacer(),
                const SizedBox(width: 5),
                Iconify(
                  Uil.arrow_up_right,
                  size: 24,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ],
            ),
          )
    );
  }

  Future<void> createSaleOffer(BuildContext context) async {
    if (catInfo != null) {
      await showCreateSaleOfferBottomSheet(
          context,
          catInfo!.id.toInt(),
        onSuccess: (SaleOfferInfo info) async {
            setState(() {
              saleOfferInfo = info;
            });
        }
      );
    }
  }

  Widget getPriceBox(BuildContext context, Money money) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            MoneyTools.convertToString(money, compact: true),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground
            ),
          ),
        ],
      )
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await initCatInfo(context);
    await initCatSaleOffer(context);
  }

  Future<void> initCatSaleOffer(BuildContext context) async {
    try {
      if (catInfo != null) {
        MyCatPageArguments arguments = ModalRoute.of(context)!.settings.arguments as MyCatPageArguments;
        setState(() {
          isSaleOfferLoading = true;
        });
        SaleOfferInfo result = await tradeService.getSaleOfferByCatId(arguments.catId);
        setState(() {
          saleOfferInfo = result;
          isSaleOfferLoading = false;
        });
      }
    } on GrpcError catch (error) {
      if (error.code == Code.NOT_FOUND.value) {
        setState(() {
          isSaleOfferLoading = false;
        });
      } else if (context.mounted) {
        showNotificationMessage(context, error.message ?? "Grpc error", status: NotificationMessageStatus.error);
      }
    }
  }

  Future<void> initCatInfo(BuildContext context) async {
    try {
      MyCatPageArguments arguments = ModalRoute.of(context)!.settings.arguments as MyCatPageArguments;
      CatInfo result = await catService.getCat(GetCatRequest(id: Int64(arguments.catId)));
      if (context.mounted) {
        setState(() {
          catInfo = result;
        });
      }
    } on GrpcError catch (error) {
      if (context.mounted) {
        showNotificationMessage(context, error.message ?? "Grpc error", status: NotificationMessageStatus.error);
      }
    }
  }
}