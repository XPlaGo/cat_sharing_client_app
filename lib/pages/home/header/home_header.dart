import 'package:cat_sharing_client_app/components/buttons/icon_button.dart';
import 'package:cat_sharing_client_app/components/cat_coins/cat_coins_chip.dart';
import 'package:cat_sharing_client_app/pages/home/header/profile_button.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/uil.dart';

class HomeHeader extends StatefulWidget {

  final bool isDrawerOpened;
  final Function(bool) setDrawerState;

  const HomeHeader({
    super.key,
    required this.setDrawerState,
    required this.isDrawerOpened
  });

  @override
  State<StatefulWidget> createState() => HomeHeaderState();
}

class HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 26),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CSIconButton(
              onPressed: (reset) async {
                widget.setDrawerState(!widget.isDrawerOpened);
              },
              icon: widget.isDrawerOpened ? Uil.multiply : Uil.bars,
            ),
            const CatCoinsChip(value: 123000,),
          ]
      ),
    );
  }
}