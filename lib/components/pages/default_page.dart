import 'package:cat_sharing_client_app/components/buttons/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/uil.dart';

class DefaultPage extends StatefulWidget {
  final Widget Function(Function()) getChild;
  final Widget Function(Function())? getAppBarChild;
  final Widget? floatingButton;

  const DefaultPage({
    super.key,
    required this.getChild,
    this.getAppBarChild,
    this.floatingButton,
  });

  @override
  State<StatefulWidget> createState() => DefaultPageState();
}

class DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: widget.floatingButton,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              getAppBar(context),
              getPageBody(context),
            ],
          )
        ));
  }

  Widget getAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CSIconButton(onPressed: (reset) async {
            await getGoBack(context)();
          }, icon: Uil.arrow_left),
          Expanded(
            child: widget.getAppBarChild == null
                ? const SizedBox()
                : widget.getAppBarChild!(getGoBack(context)),
          )
        ],
      ),
    );
  }

  Widget getPageBody(BuildContext context) {
    return Expanded(child: widget.getChild(getGoBack(context)));
    // return Expanded(
    //   child: Container(
    //     color: Colors.blueGrey,
    //     child: ScrollShadow(
    //       size: 32,
    //       color: Theme.of(context).colorScheme.background,
    //       child: SingleChildScrollView(
    //         child: widget.getChild(getGoBack(context)),
    //       ),
    //     ),
    //   )
    // );
  }

  Function() getGoBack(BuildContext context) {
    return () {
      Navigator.of(context).pop();
    };
  }
}
