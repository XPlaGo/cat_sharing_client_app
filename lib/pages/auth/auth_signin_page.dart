import 'dart:convert';
import 'dart:developer';

import 'package:cat_sharing_client_app/components/buttons/icon_button.dart';
import 'package:cat_sharing_client_app/components/inputs/text_input.dart';
import 'package:cat_sharing_client_app/components/pages/plain_page.dart';
import 'package:cat_sharing_client_app/components/notification/notification_message.dart';
import 'package:cat_sharing_client_app/generated/auth.pb.dart';
import 'package:cat_sharing_client_app/services/auth_service.dart';
import 'package:cat_sharing_client_app/services/grpc_tools_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:unicons/unicons.dart' as unicons;

class AuthSigninPage extends StatefulWidget {
  const AuthSigninPage({super.key});

  @override
  State<StatefulWidget> createState() => AuthSigninPageState();
}

class AuthSigninPageState extends State<AuthSigninPage> {

  AuthService authService = GetIt.instance<AuthService>();

  String passwordValue = "";
  bool isVerificationLoading = false;
  bool isResendCodeLoading = false;

  Map<String, dynamic>? errors;

  @override
  Widget build(BuildContext context) {
    return PlainPage(
      floatingButton: getFloatingButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      child: getChild(context),
    );
  }

  Widget getFloatingButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CSIconButton(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            overlayColor: Theme.of(context).colorScheme.shadow,
            icon: Uil.arrow_left,
            onPressed: (reset) async {
              Navigator.of(context).pop();
            },
            shadow: [BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
              blurRadius: 10,
            )],
          ),
          const SizedBox(width: 10),
          const Spacer(),
          const SizedBox(width: 10),
          CSIconButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            disabledBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
            disabledColor: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
            overlayColor: Theme.of(context).colorScheme.shadow,
            color: Theme.of(context).colorScheme.onPrimary,
            icon: Uil.arrow_right,
            //isLoading: isVerificationLoading,
            isDisabled: passwordValue.length < 6,
            onPressed: (reset) async {
              await getSigninHandler(context, reset)();
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

  Widget getChild(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Hero(
                      tag: "authLogo",
                      child: Image(image: AssetImage("assets/icon/cs_logo_1152_rounded.png"))
                  ),
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
          Text("Sign in", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20,),
          CSTextInput(
            obscureText: true,
            maxLines: 1,
            keyboardType: TextInputType.text,
            placeholder: "Password",
            errorText: errors?["password"]?["message"],
            prefixIcon: Icon(
              unicons.UniconsLine.asterisk,
              size: 24,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
            onChanged: (value) {
              setState(() {
                passwordValue = value;
              });
            },
            onComplete: (value) {
              showBottomSheet(context: context, builder: (BuildContext context) {
                return Text(value);
              });
            },
          ),
          const SizedBox(height: 15,),
        ],
      ),
    );
  }

  Future<void> Function() getSigninHandler(BuildContext context, void Function() reset) {
    return () async {
      if (!isResendCodeLoading) {
        try {
          setState(() {
            isResendCodeLoading = true;
          });
          bool result = await signin();
          if (result && context.mounted) {
            showNotificationMessage(
                context,
                "You successfully signed in",
                status: NotificationMessageStatus.success
            );
            Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => false)
              .then((value) => reset());
          }
        } on GrpcError catch (e) {
          setState(() {
            errors = GrpcToolsService.extractErrorsFromTrailers(e);
          });
          if (context.mounted) showNotificationMessage(context, "${e.message}", status: NotificationMessageStatus.error);
        } catch (e) {
          if (context.mounted) showNotificationMessage(context, "$e", status: NotificationMessageStatus.error);
        }
        setState(() {
          isResendCodeLoading = false;
        });
      }
    };
  }

  Future<bool> signin() async {
    TokenWithUserResponse response = await authService.signIn(SignInRequest(
      password: passwordValue,
    ));
    return response.hasAccessToken();
  }
}