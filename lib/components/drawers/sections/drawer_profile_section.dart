import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:cat_sharing_client_app/components/skeletons/default_skeleton.dart';
import 'package:cat_sharing_client_app/generated/auth.pb.dart';
import 'package:cat_sharing_client_app/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:unicons/unicons.dart' as unicons;

class DrawerProfileSection extends StatefulWidget {

  final Function(bool) setDrawerState;
  const DrawerProfileSection({super.key, required this.setDrawerState});

  @override
  State<StatefulWidget> createState() => DrawerProfileSectionState();
}

class DrawerProfileSectionState extends State<DrawerProfileSection> {
  
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
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: CSSkeleton(
          enabled: userInfo == null,
          child: CSFlatButton(
              showLoader: false,
              onPressed: (reset) async {
                if (mounted) {
                  widget.setDrawerState(false);
                  Navigator.of(context).pushNamed("/profile").then((value) => reset());
                }
              },
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              backgroundColor: Theme.of(context).colorScheme.background,
              child: Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: getProfileImage(context),
                  ),
                  const SizedBox(width: 10),
                  Text(userInfo?.name ?? "Unknown", style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700
                  )),
                  const Spacer(),
                  Icon(
                    unicons.UniconsLine.angle_right_b,
                    size: 24,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  )
                ],
              )),
        )
      ),
    );
  }

  Widget getProfileImage(BuildContext context) {
    if (userInfo == null || userInfo!.avatar.isEmpty) {
      return Container(
        height: 48,
        width: 48,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Center(
          child: Iconify(
            Uil.user,
            size: 24,
            color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
          ),
        )
      );
    } else {
      return Image.network(userInfo!.avatar);
    }
  }
}
