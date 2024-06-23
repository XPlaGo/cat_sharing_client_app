import 'dart:convert';
import 'dart:developer';

import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:cat_sharing_client_app/components/buttons/icon_button.dart';
import 'package:cat_sharing_client_app/components/inputs/text_input.dart';
import 'package:cat_sharing_client_app/components/pages/plain_page.dart';
import 'package:cat_sharing_client_app/components/notification/notification_message.dart';
import 'package:cat_sharing_client_app/generated/auth.pb.dart';
import 'package:cat_sharing_client_app/generated/auth.pbgrpc.dart';
import 'package:cat_sharing_client_app/generated/google/protobuf/timestamp.pb.dart';
import 'package:cat_sharing_client_app/services/auth_service.dart';
import 'package:cat_sharing_client_app/services/grpc_tools_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:intl/intl.dart';
import 'package:unicons/unicons.dart' as unicons;

class AuthSignupPage extends StatefulWidget {
  const AuthSignupPage({super.key});

  @override
  State<StatefulWidget> createState() => AuthSignupPageState();
}

class AuthSignupPageState extends State<AuthSignupPage> {

  AuthService authService = GetIt.instance<AuthService>();

  String nameValue = "";
  String passwordValue = "";
  DateTime? birthdayValue;
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
            disabledColor: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.3),
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
    return Center(
      child: SingleChildScrollView(
        child: Container(
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
              Text("Sign up", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20,),
              getSignUpForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget getSignUpForm(BuildContext context) {
    return Form(
        child: Column(
          children: [
            getNameInput(context),
            const SizedBox(height: 15),
            getPasswordInput(context),
            const SizedBox(height: 15),
            getBirthdayInput(context),
            const SizedBox(height: 60,)
          ],
        )
    );
  }

  Widget getPasswordInput(BuildContext context) {
    return CSTextInput(
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
    );
  }

  Widget getNameInput(BuildContext context) {
    return CSTextInput(
      keyboardType: TextInputType.text,
      placeholder: "Name",
      errorText: errors?["name"]?["message"],
      prefixIcon: Icon(
        unicons.UniconsLine.user,
        size: 24,
        color: Theme.of(context).textTheme.bodyMedium?.color,
      ),
      onChanged: (value) {
        setState(() {
          nameValue = value;
        });
      },
      onComplete: (value) {
        showBottomSheet(context: context, builder: (BuildContext context) {
          return Text(value);
        });
      },
    );
  }

  Widget getBirthdayInput(BuildContext context) {
    return CSFlatButton(
        padding: const EdgeInsets.all(0),
        onPressed: (reset) async {
          await getBirthdayHandler(context)();
        },
        errorText: errors?["birthday"]?["message"],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Iconify(
                Uil.calender,
                size: 24,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                child: Text(
                  birthdayValue == null ?
                      "Select your birthday"
                      : DateFormat("d MMMM y").format(birthdayValue!),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(
                        birthdayValue == null ? 0.5 : 1
                    )
                  ),
                ),
              )
            )
          ],
        )
    );
  }

  Future<void> Function() getBirthdayHandler(BuildContext context) {
    return () async {
      DateTime? birthdayResult = await showDatePicker(
        helpText: "Select your birthday",
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      setState(() {
        birthdayValue = birthdayResult;
      });
    };
  }

  Future<void> Function() getSigninHandler(BuildContext context, void Function() reset) {
    return () async {
      if (!isResendCodeLoading) {
        try {
          setState(() {
            isResendCodeLoading = true;
          });
          bool result = await signup();
          if (result && context.mounted) {
            showNotificationMessage(
                context,
                "You successfully signed up",
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

  Future<bool> signup() async {
    TokenWithUserResponse response = await authService.signUp(SignUpRequest(
      name: nameValue,
      password: passwordValue,
      birthday: (birthdayValue == null) ? null : Timestamp.fromDateTime(birthdayValue!)
    ));
    return response.hasAccessToken();
  }
}