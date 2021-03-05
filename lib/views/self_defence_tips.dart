import 'package:flutter/material.dart';
import 'package:self_defence/constants.dart';
import '../model/tip_model.dart';
import '../data/tips.dart';

class SelfDefenceTips extends StatefulWidget {
  static const String id = "SelfDefenceTips";
  @override
  _SelfDefenceTipsState createState() => _SelfDefenceTipsState();
}

class _SelfDefenceTipsState extends State<SelfDefenceTips> {
  List<Tip> _tips = new List();

  ExpansionPanel _createTip(Tip tip) {
    return new ExpansionPanel(
        headerBuilder: (context, bool isExpanded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 8.0, left: 8.0, bottom: 8.0),
                  child: Image.asset(
                    tip.imgUrl,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 10.5,
                    width: MediaQuery.of(context).size.width / 3.5,
                  ),
                ),
                Flexible(
                    child: Text(
                  tip.title,
                  style: kBoldText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ))
              ],
            ),
          );
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Column(
            children: [
              Image.asset(
                tip.imgUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(tip.description,
                  textAlign: TextAlign.justify, style: kTextStyle),
            ],
          ),
        ),
        isExpanded: tip.isExpanded);
  }

  @override
  void initState() {
    _tips = getTips();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("8 Self Defence Tips Every\nWomen should know"),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 8),
          children: [
            ExpansionPanelList(
              expandedHeaderPadding: EdgeInsets.zero,
              elevation: 0,
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _tips[index].isExpanded = !_tips[index].isExpanded;
                });
              },
              children: _tips.map(_createTip).toList(),
            ),
          ],
        ));
  }
}
