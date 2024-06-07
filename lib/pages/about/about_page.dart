import 'dart:async';

import 'package:cat_sharing_client_app/components/pages/default_page.dart';
import 'package:cat_sharing_client_app/components/skeletons/default_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<StatefulWidget> createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {

  String? version;
  String? buildNumber;

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      getAppBarChild: getAppBarChild,
      getChild: getChild,
    );
  }

  @override
  void initState() {
    super.initState();
    initAppVersionState();
  }

  Future<void> initAppVersionState() async {

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
  }

  Widget getChild(Function() goBack) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Hero(
                      tag: "authLogo",
                      child: Image(image: AssetImage("assets/icon/cs_logo_1152_rounded.png"))
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
          Text("Cat Sharing", style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 5,),
          CSSkeleton(
            enabled: version == null || buildNumber == null,
            child: Text("$version:$buildNumber", style: Theme.of(context).textTheme.bodyMedium)
          )
        ],
      ),
    );
  }

  Widget getAppBarChild(Function() goBack) {
    return Text("About", style: Theme.of(context).textTheme.titleMedium,);
  }
}