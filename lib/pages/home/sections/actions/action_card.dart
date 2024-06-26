import 'package:cat_sharing_client_app/components/buttons/flat_button.dart';
import 'package:flutter/material.dart';

class ActionCard extends StatefulWidget {
  final String actionName;
  final String imagePath;
  final Function(Function())? onPressed;

  const ActionCard({
    super.key,
    required this.actionName,
    required this.imagePath,
    this.onPressed,
  });

  @override
  State<StatefulWidget> createState() => ActionCardState();
}

class ActionCardState extends State<ActionCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: CSFlatButton(
              showLoader: false,
              onPressed: (reset) async {
                if (widget.onPressed != null) await widget.onPressed!(reset);
              },
              padding: const EdgeInsets.all(0),
              child: Image(image: AssetImage(widget.imagePath))),
        ),
        Center(
          child: Text(
            widget.actionName,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        )
      ],
    );
  }
}
