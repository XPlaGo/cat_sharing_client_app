import 'package:cat_sharing_client_app/components/pages/faded_page.dart';
import 'package:flutter/material.dart';

class MyCatsPage extends StatefulWidget {
  const MyCatsPage({super.key});

  @override
  State<StatefulWidget> createState() => MyCatsPageState();
}

class MyCatsPageState extends State<MyCatsPage> {
  @override
  Widget build(BuildContext context) {
    return FadedPage(
      getAppBarChild: getAppBarChild,
        getChild: getChild,
    );
  }

  Widget getChild(Function() goBack) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      child: Column(children: [
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: Theme.of(context).colorScheme.background,
          ),
        )
      ],),
    );
  }

  Widget getAppBarChild(Function() goBack) {
    return Text("My cats", style: Theme.of(context).textTheme.titleMedium,);
  }
}
