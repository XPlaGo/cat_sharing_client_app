import 'dart:developer';

import 'package:cat_sharing_client_app/components/buttons/accent_button.dart';
import 'package:cat_sharing_client_app/components/notification/notification_message.dart';
import 'package:cat_sharing_client_app/generated/cat.pb.dart';
import 'package:cat_sharing_client_app/generated/google/protobuf/timestamp.pb.dart';
import 'package:cat_sharing_client_app/pages/my_cat/my_cat_page.dart';
import 'package:cat_sharing_client_app/services/cat_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:intl/intl.dart';
import 'package:unicons/unicons.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../components/buttons/flat_button.dart';
import '../../components/inputs/text_input.dart';
import '../../services/grpc_tools_service.dart';

class CreateCatBottom extends StatefulWidget {

  final Future<void> Function() refreshData;

  const CreateCatBottom({
    super.key,
    required this.refreshData,
  });

  @override
  State<StatefulWidget> createState() => CreateCatBottomState();
}

class CreateCatBottomState extends State<CreateCatBottom> {

  CatService catService = GetIt.instance<CatService>();

  String avatarIdValue = "avatar1";
  String nameValue = "";
  DateTime? birthdayValue;

  Map<String, dynamic>? errors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: SingleChildScrollView(
        child: getSignUpForm(context),
      ),
    );
  }

  Widget getSignUpForm(BuildContext context) {
    return Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Add cat", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 32),
            getCatAvatarSelector(context),
            const SizedBox(height: 10),
            Text("Select avatar", style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5)
            )),
            const SizedBox(height: 20),
            getNameInput(context),
            const SizedBox(height: 15),
            getBirthdayInput(context),
            const SizedBox(height: 15),
            getCreateCatButton(context),
          ],
        )
    );
  }

  Widget getNameInput(BuildContext context) {
    return CSTextInput(
      keyboardType: TextInputType.text,
      placeholder: "Cat's name",
      errorText: errors?["name"]?["message"],
      prefixIcon: Icon(
        UniconsLine.letter_english_a,
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

  Future<void> Function() getBirthdayHandler(BuildContext context) {
    return () async {
      DateTime? birthdayResult = await showDatePicker(
        helpText: "Select cat's birthday",
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      setState(() {
        birthdayValue = birthdayResult;
      });
    };
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

  Widget getCreateCatButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CSAccentButton(
            prefixIcon: const Iconify(
              Uil.plus,
              size: 24,
              color: Colors.black,
            ),
            text: "Add",
            onPressed: (reset) async {
              await getCreateCatHandler(context, reset)();
            },
          ),
        )
      ],
    );
  }

  Widget getCatAvatarSelector(BuildContext context) {
    return ScrollShadow(
      color: Theme.of(context).colorScheme.background,
      size: 32,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return CarouselSlider(
            items: [
              getAvatarSelectorItem(context, 0),
              getAvatarSelectorItem(context, 1),
              getAvatarSelectorItem(context, 2),
              getAvatarSelectorItem(context, 3),
              getAvatarSelectorItem(context, 4),
            ],
            options: CarouselOptions(
              onPageChanged: (selectedIndex, reason) async {
                setState(() {
                  avatarIdValue = "avatar${selectedIndex + 1}";
                });
              },
              viewportFraction: 0.5,
              enlargeFactor: 0.5,
              enlargeCenterPage: true,
              aspectRatio: 1,
              height: constraints.maxWidth / 2,
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
            ),
          );
        },
      ),
    );
  }

  Widget getAvatarSelectorItem(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Container(
        child: Image(
          image: AssetImage("assets/avatar/avatar${index + 1}.png"),
        ),
      ),
    );
  }

  Future<void> Function() getCreateCatHandler(BuildContext context, void Function() reset) {
    return () async {
      try {
        CatInfo catInfo = await createCat();
        if (context.mounted) {
          showNotificationMessage(
              context,
              "Cat \"${catInfo.name}\" was successfully added",
              status: NotificationMessageStatus.success
          );
          await widget.refreshData();
          if (context.mounted) Navigator.of(context).pop();
          if (context.mounted) {
            Navigator.of(context).pushNamed("/my_cat", arguments: MyCatPageArguments(catId: catInfo.id.toInt()))
                .then((value) => reset());
          }
        }
      } on GrpcError catch (e) {
        setState(() {
          errors = GrpcToolsService.extractErrorsFromTrailers(e);
        });
        if (context.mounted) showNotificationMessage(context, "${e.message}", status: NotificationMessageStatus.error);
      } catch (e) {
        if (context.mounted) showNotificationMessage(context, "$e", status: NotificationMessageStatus.error);
      }
    };
  }

  Future<CatInfo> createCat() async {
    return await catService.createCat(CreateCatRequest(
      name: nameValue,
      birthday: (birthdayValue == null) ? null : Timestamp.fromDateTime(birthdayValue!),
      avatarId: avatarIdValue,
    ));
  }
}