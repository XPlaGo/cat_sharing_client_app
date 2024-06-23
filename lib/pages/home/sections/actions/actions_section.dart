import 'package:cat_sharing_client_app/pages/home/sections/actions/action_card.dart';
import 'package:cat_sharing_client_app/pages/sale_offers/sale_offers_page.dart';
import 'package:flutter/material.dart';

class ActionsSection extends StatefulWidget {

  const ActionsSection({super.key});
  @override
  State<StatefulWidget> createState() => ActionsSectionState();
}

class ActionsSectionState extends State<ActionsSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 26),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                  child: ActionCard(
                    actionName: "Arend",
                    imagePath: "assets/actions/arend4.png",
                  )
              ),
              SizedBox(width: 20,),
              Expanded(
                  child: ActionCard(
                    actionName: "Expose",
                    imagePath: "assets/actions/present.png",
                  ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                  child: ActionCard(
                    actionName: "Byu",
                    imagePath: "assets/actions/buy4.png",
                    onPressed: (reset) {
                      Navigator.of(context).pushNamed(SaleOffersPage.pageRoute).then((value) => reset());
                    },
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}