import 'package:cat_sharing_client_app/components/inputs/text_input.dart';
import 'package:cat_sharing_client_app/components/pages/default_page.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart' as unicons;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  String searchValue = "";

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      getAppBarChild: getAppBarChild(context),
      getChild: getChild(context),
    );
  }

  Widget Function(Function()) getAppBarChild(BuildContext context) {
    return (gpBack) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Hero(
            tag: "searchInput",
            child: Card(
              child: CSTextInput(
                placeholder: "Search in Cat Sharing",
                autofocus: true,
                onComplete: (String value) {
                  setState(() {
                    searchValue = "Completed: $value";
                  });
                },
                onChanged: (String value) {
                  setState(() {
                    searchValue = "Changed: $value";
                  });
                },
                prefixIcon: Icon(
                  unicons.UniconsLine.search,
                  size: 24,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            )),
      );
    };
  }

  Widget Function(Function()) getChild(BuildContext context) {
    return (goBack) {
      return SafeArea(child: Column(children: [
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
        Text(searchValue),
      ]));
    };
  }
}
