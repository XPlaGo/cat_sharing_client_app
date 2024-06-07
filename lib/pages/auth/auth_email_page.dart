import 'package:cat_sharing_client_app/components/buttons/icon_button.dart';
import 'package:cat_sharing_client_app/components/inputs/text_input.dart';
import 'package:cat_sharing_client_app/components/pages/plain_page.dart';
import 'package:cat_sharing_client_app/components/notification/notification_message.dart';
import 'package:cat_sharing_client_app/generated/auth.pb.dart';
import 'package:cat_sharing_client_app/pages/auth/auth_verify_page.dart';
import 'package:cat_sharing_client_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:session_storage/session_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicons/unicons.dart' as unicons;

class AuthEmailPage extends StatefulWidget {
  const AuthEmailPage({super.key});

  @override
  State<StatefulWidget> createState() => AuthEmailPageState();
}

class AuthEmailPageState extends State<AuthEmailPage> {

  String emailValue = "+7 (";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return PlainPage(
        floatingButton: CSIconButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          disabledBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
          disabledColor: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
          overlayColor: Theme.of(context).colorScheme.shadow,
          color: const Color(0xFF000000),
          icon: Uil.arrow_right,
          //isLoading: isLoading,
          isDisabled: !validateEmail(emailValue),
          onPressed: (reset) async {
            await getSendVerificationCodeHandler(context, reset)();
          },
          shadow: [BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
            blurRadius: 10,
          )],
        ),
        child: Padding(
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
                keyboardType: TextInputType.emailAddress,
                placeholder: "Email",
                prefixIcon: Icon(
                  unicons.UniconsLine.envelope,
                  size: 24,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
                onChanged: (value) {
                  setState(() {
                    emailValue = value;
                  });
                },
                onComplete: (value) {
                  showBottomSheet(context: context, builder: (BuildContext context) {
                    return Text(value);
                  });
                },
              ),
            ],
          ),
        )
    );
  }

  bool validateEmail(String value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value.isNotEmpty && regex.hasMatch(value);
  }

  Future<void> Function() getSendVerificationCodeHandler(BuildContext context, void Function() reset) {
    return () async {
      if (!isLoading) {
        try {
          setState(() {
            isLoading = true;
          });
          bool result = await sendVerificationCode();
          if (result && mounted) {
            showNotificationMessage(
                context,
                "Verification code was sent on $emailValue",
                status: NotificationMessageStatus.success
            );
            Navigator.of(context).pushNamed(
                "/auth_verify",
                arguments: AuthVerifyPageArguments(email: emailValue)
            ).then((value) => reset());
          }
        } catch (e) {
          if (mounted) showNotificationMessage(context, "${(e as GrpcError).message}", status: NotificationMessageStatus.error);
        }
        setState(() {
          isLoading = false;
        });
      }
    };
  }

  Future<bool> sendVerificationCode() async {
    PlainTokenResponse response = await AuthService().sendEmail(emailValue);
    return response.hasAccessToken();
  }
}