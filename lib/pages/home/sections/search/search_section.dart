import 'package:cat_sharing_client_app/pages/home/sections/search/search_section_button.dart';
import 'package:flutter/cupertino.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<StatefulWidget> createState() => SearchSectionState();

}

class SearchSectionState extends State<SearchSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 26),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Hero(tag: "searchInput", child: SearchSectionButton())
            )
          ],
        ),
      ),
    );
  }
}