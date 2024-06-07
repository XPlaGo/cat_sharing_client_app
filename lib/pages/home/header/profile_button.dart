import 'package:flutter/material.dart';

class ProfileButton extends StatefulWidget {
  const ProfileButton({super.key});

  @override
  State<StatefulWidget> createState() => ProfileButtonState();
}

class ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            )
        ),
      ),
        padding: const EdgeInsets.all(0),
        onPressed: () {},
        icon: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          clipBehavior: Clip.hardEdge,
          height: 48,
          width: 48,
          child: const Image(image: AssetImage("assets/test/profile.jpg"))
        ));
  }
}
