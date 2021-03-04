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
          return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              leading: Image.asset(tip.imgUrl),
              title: Text(tip.title, style: kBoldText, ));
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            
          ),
          child: Column(
            children: [
              Image.asset(
                tip.imgUrl,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                tip.description,
                textAlign: TextAlign.justify,
                style: kTextStyle
              ),
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
