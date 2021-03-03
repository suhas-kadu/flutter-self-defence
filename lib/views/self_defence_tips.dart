import 'package:flutter/material.dart';
import '../model/tip_model.dart';
import '../data/tips.dart';

class SelfDefenceTips extends StatefulWidget {
  static const String id = "SelfDefenceTips";
  @override
  _SelfDefenceTipsState createState() => _SelfDefenceTipsState();
}

class _SelfDefenceTipsState extends State<SelfDefenceTips> {
  List<Tip> _tips = new List();
  @override
  void initState() {
    _tips = getTips();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010101),
      appBar: AppBar( 
        backgroundColor: Color(0xFF010101),
          title: Text("8 Self Defence Tips Every\nWomen should know"),
      
      ),  
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        
        itemCount: _tips.length,
        itemBuilder: (context, index){
          return Column(
            children: [
          Image.asset(
                _tips[index].imgUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
              Text(_tips[index].description, 
              style: TextStyle(
                color: Color(0xFFf0ece2), 
                fontSize: 16,
                ),
                textAlign: TextAlign.justify,
                ),
              SizedBox(height: 30)

          ],);
      }),
    );
  }
}