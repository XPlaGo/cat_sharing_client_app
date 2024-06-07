import 'dart:io';

import 'package:cat_sharing_client_app/components/buttons/accent_button.dart';
import 'package:cat_sharing_client_app/components/buttons/icon_button.dart';
import 'package:cat_sharing_client_app/components/inputs/verification_code_input.dart';
import 'package:cat_sharing_client_app/components/pages/plain_page.dart';
import 'package:cat_sharing_client_app/components/notification/notification_message.dart';
import 'package:cat_sharing_client_app/generated/auth.pb.dart';
import 'package:cat_sharing_client_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:quiver/async.dart';

class VerificationResult {
  final bool success;
  final bool userExists;

  VerificationResult({required this.success, required this.userExists});
}

class AuthVerifyPageArguments {
  final String email;

  AuthVerifyPageArguments({required this.email});
}

class AuthVerifyPage extends StatefulWidget {
  const AuthVerifyPage({super.key});

  @override
  State<StatefulWidget> createState() => AuthVerifyPageState();
}

class AuthVerifyPageState extends State<AuthVerifyPage> {

  String verificationCode = "";
  bool isVerificationLoading = false;
  bool isResendCodeLoading = false;


  final int _start = 30;
  int _current = 30;
  CountdownTimer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  void startTimer() {

    setState(() {
      _timer = CountdownTimer(
        Duration(seconds: _start),
        const Duration(seconds: 1),
      );

      var sub = _timer?.listen(null);
      sub?.onData((duration) {
        setState(() { _current = _start - duration.elapsed.inSeconds; });
      });

      sub?.onDone(() {
        print("Done");
        sub.cancel();
        _current = _start;
        _timer = null;
      });
    });
  }

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
            //color: const Color(0xFF000000),
            icon: Uil.arrow_left,
            onPressed: (reset) async {
              Navigator.of(context).pop();
            },
            shadow: [BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
              blurRadius: 10,
            )],
          ),
          const SizedBox(width: 5),
          Expanded(
            child: CSAccentButton(
                loaderSize: 24,
                onPressed: (reset) async {
                  if (_timer == null) {
                    await getSendVerificationCodeHandler(context, reset)();
                    startTimer();
                  }
                },
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                //isLoading: isResendCodeLoading,
                isDisabled: _timer != null,
                text: _timer == null ? "Resend code" : "$_current sec",
                shadow: [BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
                  blurRadius: 10,
                )],
            ),
          ),
          const SizedBox(width: 5),
          CSIconButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            disabledBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
            disabledColor: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
            overlayColor: Theme.of(context).colorScheme.shadow,
            color: const Color(0xFF000000),
            icon: Uil.arrow_right,
            //isLoading: isVerificationLoading,
            isDisabled: verificationCode.length != 4,
            onPressed: (reset) async {
              await getVerificationHandler(context, reset)();
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
          Text("Verification", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CSVerificationCode(
                  onCompleted: (String value) {
                    setState(() {
                      verificationCode = value;
                    });
                  },
                  itemSize: 45,
                  onEditing: (bool value) {
                    setState(() {
                      verificationCode = "";
                    });
                  },
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  textStyle: Theme.of(context).textTheme.bodyLarge!,
                  autofocus: true,
                  length: 4,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15,),
        ],
      ),
    );
  }

  Future<void> Function() getVerificationHandler(BuildContext context, void Function() reset) {
    return () async {
      if (!isVerificationLoading) {
        setState(() {
          isVerificationLoading = true;
        });
        try {
          VerificationResult result = await verification();
          if (result.success && mounted) {
            showNotificationMessage(
                context,
                "Email was confirmed",
                status: NotificationMessageStatus.success
            );
            if (result.userExists) {
              Navigator.of(context).pushReplacementNamed("/auth_signin")
                  .then((value) => reset());
            } else {
              Navigator.of(context).pushReplacementNamed("/auth_signup")
                  .then((value) => reset());
            }
          }
        } on GrpcError catch (e) {
          if (mounted) {
            showNotificationMessage(context, "${e.message}", status: NotificationMessageStatus.error);
          }
        } on SocketException {
          if (mounted) {
            showNotificationMessage(context, "Connection error, retry later", status: NotificationMessageStatus.error);
          }
        } on Exception catch (e) {
          if (mounted) {
            showNotificationMessage(context, e.toString(), status: NotificationMessageStatus.error);
          }
        }
        catch (e) {
          print(e);
          if (mounted) {
            showNotificationMessage(context, e.toString(), status: NotificationMessageStatus.error);
          }
        }
        setState(() {
          isVerificationLoading = false;
        });
      }
    };
  }

  Future<VerificationResult> verification() async {
    VerifiedTokenResponse response = await AuthService().sendVerificationCode(verificationCode);
    return VerificationResult(success: response.hasAccessToken(), userExists: response.userExists);
  }

  Future<void> Function() getSendVerificationCodeHandler(BuildContext context, void Function() reset) {
    final args = ModalRoute.of(context)!.settings.arguments as AuthVerifyPageArguments;
    return () async {
      if (!isResendCodeLoading) {
        try {
          setState(() {
            isResendCodeLoading = true;
          });
          bool result = await sendVerificationCode();
          if (result && mounted) {
            showNotificationMessage(
                context,
                "Verification code was sent on ${args.email}",
                status: NotificationMessageStatus.success
            );
          }
        } catch (e) {
          if (mounted) showNotificationMessage(context, "${(e as GrpcError).message}", status: NotificationMessageStatus.error);
        }
        setState(() {
          isResendCodeLoading = false;
        });
      }
    };
  }

  Future<bool> sendVerificationCode() async {
    final args = ModalRoute.of(context)!.settings.arguments as AuthVerifyPageArguments;
    PlainTokenResponse response = await AuthService().sendEmail(args.email);
    return response.hasAccessToken();
  }
}