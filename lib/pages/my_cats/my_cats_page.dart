import 'dart:async';

import 'package:cat_sharing_client_app/components/inputs/text_input.dart';
import 'package:cat_sharing_client_app/components/modals/default_bottom_sheet.dart';
import 'package:cat_sharing_client_app/components/notification/notification_message.dart';
import 'package:cat_sharing_client_app/components/pages/default_page.dart';
import 'package:cat_sharing_client_app/components/skeletons/default_skeleton.dart';
import 'package:cat_sharing_client_app/generated/cat.pb.dart';
import 'package:cat_sharing_client_app/pages/my_cats/add_cat_bottom.dart';
import 'package:cat_sharing_client_app/pages/my_cats/my_cats_tabs.dart';
import 'package:cat_sharing_client_app/services/owner_service.dart';
import 'package:cat_sharing_client_app/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:after_layout/after_layout.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:unicons/unicons.dart';

import '../../components/buttons/icon_button.dart';

class MyCatsPage extends StatefulWidget {
  const MyCatsPage({super.key});

  @override
  State<StatefulWidget> createState() => MyCatsPageState();
}

class MyCatsPageState extends State<MyCatsPage> with AfterLayoutMixin<MyCatsPage> {

  OwnerService ownerService = GetIt.instance<OwnerService>();

  OwnerInfo? ownerInfo;

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    await createOrGetOwnerInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      floatingButton: getFloatingButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      getAppBarChild: getAppBarChild,
      getChild: getChild,
    );
  }

  Widget getChild(Function() goBack) {
    return CSSkeleton(
      enabled: ownerInfo == null,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: CSTextInput(
              placeholder: "Search in cats",
              prefixIcon: Icon(
                UniconsLine.search,
                size: 24,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: MyCatsTabs(ownerInfo: ownerInfo),
            ),
          )
        ],
      ),
    );
  }

  Widget getAppBarChild(Function() goBack) {
    return Text("My cats", style: Theme.of(context).textTheme.titleMedium,);
  }

  Future<void> createOrGetOwnerInfo(BuildContext context) async {
    try {
      OwnerInfo ownerInfo = await ownerService.createMyOwner();
      await StorageService.saveGeneratedMessage("myOwner", ownerInfo);
      setState(() {
        this.ownerInfo = ownerInfo;
      });
    } on GrpcError catch (error) {
      if (error.code == Code.ALREADY_EXISTS.value) {
        await fetchOwnerInfo(context);
      } else {
        showNotificationMessage(context, error.message ?? "Grpc error", status: NotificationMessageStatus.error);
      }
    }
  }

  Future<void> fetchOwnerInfo(BuildContext context) async {
    try {
      OwnerInfo ownerInfo = await ownerService.getMyOwner();
      await StorageService.saveGeneratedMessage("myOwner", ownerInfo);
      setState(() {
        this.ownerInfo = ownerInfo;
      });
    } on GrpcError catch (error) {
      if (error.code == Code.ALREADY_EXISTS.value) {
        await fetchOwnerInfo(context);
      }
      showNotificationMessage(context, error.message ?? "Grpc error", status: NotificationMessageStatus.error);
    }
  }

  Widget getFloatingButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Spacer(),
          const SizedBox(width: 5),
          CSIconButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            disabledBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
            disabledColor: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
            overlayColor: Theme.of(context).colorScheme.shadow,
            color: Theme.of(context).colorScheme.onPrimary,
            icon: Uil.plus,
            onPressed: (reset) async {
              await showAddCatModal(context);
            },
            shadow: [BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
              blurRadius: 10,
            )],
          ),
        ],
      ),
    );
  }

  Future<void> showAddCatModal(BuildContext context) async {
    await showDefaultBottomSheet(context, AddCatBottom(
      refresh: () async {
        await fetchOwnerInfo(context);
      },
    ));
  }
}
