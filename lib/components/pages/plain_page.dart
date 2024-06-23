import 'package:flutter/material.dart';

class PlainPage extends StatefulWidget {

  final Widget child;
  final Widget? floatingButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const PlainPage({
    super.key,
    required this.child,
    this.floatingButton,
    this.floatingActionButtonLocation,
  });

  @override
  State<StatefulWidget> createState() => PlainPageState();
}

class PlainPageState extends State<PlainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: widget.child
            )
          ],
        )
      ),
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButton: widget.floatingButton,
    );
  }
}