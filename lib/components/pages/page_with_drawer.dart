import 'package:flutter/material.dart';

class PageWithDrawer extends StatefulWidget {

  final Widget Function(bool, Function(bool)) getDrawerChild;
  final Widget Function(bool, Function(bool)) getPageChild;
  final Duration? animationDuration;

  const PageWithDrawer({
    super.key,
    required this.getDrawerChild,
    required this.getPageChild,
    this.animationDuration
  });

  @override
  State<StatefulWidget> createState() => PageWithDrawerState();
}

class PageWithDrawerState extends State<PageWithDrawer> {

  double xOffset = 0;
  double yOffset = 0;

  double gradXStart = -1;
  double gradYStart = -1;

  bool isDrawerOpened = false;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: Colors.transparent,
      //     statusBarIconBrightness: Brightness.dark,
      //   ),
      //   backgroundColor: Colors.transparent,
      //   toolbarHeight: 0,
      // ),
      body: Stack(
        children: [
          getDrawerBody(context),
          getPageBody(context),
        ],
      ),
    );
  }

  Widget getPageBody(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isDrawerOpened) {
          getDrawerStateSetter(context)(false);
        }
      },
      onHorizontalDragStart: (details) {
        setState(() {
          gradXStart = details.globalPosition.dx;
          gradYStart = details.globalPosition.dy;
        });
      },
      onHorizontalDragEnd: (details) {
        setState(() {
          gradXStart = -1;
          gradYStart = -1;
        });
      },
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta! > 0.0
          && details.globalPosition.dx - gradXStart > 50
        ) {
          getDrawerStateSetter(context)(true);
        } else if (details.primaryDelta! < 0
          && gradXStart - details.globalPosition.dx > 50
        ) {
          getDrawerStateSetter(context)(false);
        }
      },
      child: AnimatedContainer(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(isDrawerOpened ? 40 : 0),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                blurRadius: 50,
                spreadRadius: -10,
              )
            ]
          ),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(isDrawerOpened ? 0.90 : 1.00),
          duration: widget.animationDuration ?? const Duration(milliseconds: 200),
          child: widget.getPageChild(isDrawerOpened, getDrawerStateSetter(context))
      ),
    );
  }

  Widget getDrawerBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
        child: widget.getDrawerChild(isDrawerOpened, getDrawerStateSetter(context)),
      ),
    );
  }

  Function(bool) getDrawerStateSetter(BuildContext context) {
    return (state) async {
      setState(() {
        isDrawerOpened = state;
        xOffset = state ? MediaQuery.of(context).size.width - 100 : 0;
        yOffset = state ? (
            MediaQuery.of(context).size.height
                - MediaQuery.of(context).padding.top
                - MediaQuery.of(context).size.height * 0.9
        ) * 0.5 + MediaQuery.of(context).padding.top : 0;
      });
      await Future.delayed(widget.animationDuration ?? const Duration(milliseconds: 200));
    };
  }
}