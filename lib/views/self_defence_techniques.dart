import 'package:flutter/material.dart';
import 'package:self_defence/constants.dart';
import 'package:self_defence/data/techniques.dart';
import 'package:self_defence/model/technique_model.dart';
import 'package:self_defence/widgets/technique_widget.dart';

class SelfDefenceTechniques extends StatefulWidget {
  static const String id = "SelfDefenceTechniques";
  @override
  _SelfDefenceTechniquesState createState() => _SelfDefenceTechniquesState();
}

class _SelfDefenceTechniquesState extends State<SelfDefenceTechniques> {
  List<Technique> _techniques ;

  @override
  void initState() {
    _techniques = getTechniques();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: kPrimaryColor,
          title: Text("Self Defence Moves"),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 4.0,),
            itemCount: _techniques.length,
            itemBuilder: (context, index) {
              return TechniqueWidget(techniques: _techniques, index: index,);
            }));
  }
}
