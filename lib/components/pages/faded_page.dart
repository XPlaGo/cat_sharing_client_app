import 'package:cat_sharing_client_app/components/buttons/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:iconify_flutter/icons/uil.dart';

class FadedPage extends StatefulWidget {
  final Widget Function(Function()) getChild;
  final Widget Function(Function())? getAppBarChild;
  final Widget? floatingButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const FadedPage({
    super.key,
    required this.getChild,
    this.getAppBarChild,
    this.floatingButton,
    this.floatingActionButtonLocation,
  });

  @override
  State<StatefulWidget> createState() => FadedPageState();
}

class FadedPageState extends State<FadedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        floatingActionButton: widget.floatingButton,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              getAppBar(context),
              getPageBody(context),
            ],
          ),
        ));
  }

  Widget getAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CSIconButton(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              onPressed: (reset) async {
                await getGoBack(context)();
              },
              icon: Uil.arrow_left),
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
    return Expanded(
      child: ScrollShadow(
        size: 0,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: widget.getChild(getGoBack(context)),
          ),
        ),
      ),
    );
  }

  Function() getGoBack(BuildContext context) {
    return () {
      Navigator.of(context).pop();
    };
  }
}
