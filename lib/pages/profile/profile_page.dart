import 'package:cat_sharing_client_app/components/buttons/accent_button.dart';
import 'package:cat_sharing_client_app/components/pages/default_page.dart';
import 'package:cat_sharing_client_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      getAppBarChild: getAppBarChild(context),
      getChild: getChild(context),
    );
  }

  Widget Function(Function()) getAppBarChild(BuildContext context) {
    return (gpBack) {
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
            child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
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
                    ],
                  )
                ]
            ),
          )
      );
    };
  }

  Future<void> Function() getLogoutHandler(BuildContext context, Function() reset) {
    return () async {
      await AuthService.logoutLocal();
      Navigator.of(context).pushNamedAndRemoveUntil("/auth_email", (route) => false).then((value) => reset());
    };
  }
}
