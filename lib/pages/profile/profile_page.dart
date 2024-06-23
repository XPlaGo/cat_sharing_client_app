import 'package:cat_sharing_client_app/components/buttons/accent_button.dart';
import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:cat_sharing_client_app/components/pages/faded_page.dart';
import 'package:cat_sharing_client_app/components/skeletons/default_skeleton.dart';
import 'package:cat_sharing_client_app/components/text/overflow_scrollable_text.dart';
import 'package:cat_sharing_client_app/generated/auth.pb.dart';
import 'package:cat_sharing_client_app/services/auth_service.dart';
import 'package:cat_sharing_client_app/services/storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:intl/intl.dart';
import 'package:text_scroll/text_scroll.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

  UserInfo? userInfo;

  @override
  void initState() {
    super.initState();
    initUserInfo();
  }

  Future<void> initUserInfo() async {
    StorageService.getGeneratedMessage<UserInfo>("userInfo").then((value) {
      setState(() {
        userInfo = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadedPage(
      floatingButton: getLogoutButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      getAppBarChild: getAppBarChild(context),
      getChild: getChild(context),
    );
  }

  Widget Function(Function()) getAppBarChild(BuildContext context) {
    return (goBack) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Text("Profile", style: Theme.of(context).textTheme.titleMedium,)
      );
    };
  }

  Widget Function(Function()) getChild(BuildContext context) {
    return (goBack) {
      return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            child: CSSkeleton(
              enabled: userInfo == null,
              child: Column(
                  children: [
                    getUserCardContent(context),
                    const SizedBox(height: 10),
                    getUserContent(context),
                  ]
              ),
            )
          )
      );
    };
  }

  Widget getUserCardContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OverflowScrollableText(
                  value: userInfo?.name ?? "Unknown",
                  textStyle: Theme.of(context).textTheme.titleLarge,
                  velocity: const Velocity(pixelsPerSecond: Offset(20, 0)),
                  scrollShadowColor: Theme.of(context).colorScheme.primaryContainer,
                )
              ],
            ),
          )
        ),
        const SizedBox(width: 10),
        Container(
          height: 100,
          width: 100,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: getProfileImage(context),
        ),
      ],
    );
  }

  Widget getProfileImage(BuildContext context) {
    if (userInfo == null || userInfo!.avatar.isEmpty) {
      return Container(
          height: 100,
          width: 100,
          color: Theme.of(context).colorScheme.background,
          child: Center(
            child: Iconify(
              Uil.user,
              size: 60,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
          )
      );
    } else {
      return AspectRatio(
        aspectRatio: 1,
        child: Image.network(userInfo!.avatar, fit: BoxFit.cover,),
      );
    }
  }
  
  Widget getUserContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          getTextParameter(
              context, "Email:",
              userInfo?.email ?? "example@mail.com"
          ),
          Divider(color: Theme.of(context).dividerColor),
          getTextParameter(
              context, "Birthday:",
              DateFormat("d MMMM y").format(userInfo?.birthday.toDateTime() ?? DateTime.now())
          ),
        ],
      ),
    );
  }

  Widget getTextParameter(BuildContext context, String name, String value) {
    return CSFlatButton(
      backgroundColor: Theme.of(context).colorScheme.background,
      onPressed: (reset) async {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(name,
              softWrap: false,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5)
              ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: OverflowScrollableText(
              value: value,
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
  
  Widget getLogoutButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CSAccentButton(
              backgroundColor: Theme.of(context).colorScheme.error,
              onPressed: (reset) async {
                await getLogoutHandler(context, reset)();
              },
              text: "Log out",
              prefixIcon: const Iconify(
                Uil.signout,
                size: 24,
                color: Colors.black,
              ),
            ),
          )
        )
      ],
    );
  }

  Future<void> Function() getLogoutHandler(BuildContext context, Function() reset) {
    return () async {
      await AuthService.logoutLocal();
      Navigator.of(context).pushNamedAndRemoveUntil("/auth_email", (route) => false).then((value) => reset());
    };
  }
}
