import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart' as unicons;

class SearchSectionButton extends StatelessWidget {
  const SearchSectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CSFlatButton(
      showLoader: false,
      onPressed: (reset) async {
        Navigator.of(context).pushNamed("/search").then((value) => reset());
      },
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              unicons.UniconsLine.search,
              size: 24,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
            const SizedBox(width: 8),
            Text("Search in Cat Sharing",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
                )),
          ],
        ),
      ),
    );
  }
}
