import 'package:flutter/material.dart';
import 'package:self_defence/data/techniques.dart';
import 'package:self_defence/model/technique_model.dart';
import 'package:self_defence/views/technique_demo.dart';

class SelfDefenceTechniques extends StatefulWidget {
  static const String id = "SelfDefenceTechniques";
  @override
  _SelfDefenceTechniquesState createState() => _SelfDefenceTechniquesState();
}

class _SelfDefenceTechniquesState extends State<SelfDefenceTechniques> {
  
  List<Technique> _techniques = new List();

  @override
  void initState() {
  _techniques = getTechniques();
    super.initState();
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
    backgroundColor: Color(0xFF010101),
    appBar: AppBar(
    backgroundColor: Color(0xFF010101),
    title: Text("8 Self Defence Moves"),  
    ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _techniques.length,
        itemBuilder: (context, index){
        return ListTile(          
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              settings: RouteSettings(                
                arguments: _techniques[index]),
              builder: (context, ) => TechniqueDemo(
                // technique: _techniques[index],
              )));
          },
          contentPadding: EdgeInsets.all(8.0),
          leading: Image.asset(_techniques[index].imgUrl, fit: BoxFit.cover,),
          title: Text(_techniques[index].title, style: TextStyle(color: Color(0xfff0ece2) ),),
        );
      },
    ));
  }
}