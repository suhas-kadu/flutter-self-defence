import 'package:flutter/material.dart';
import 'package:self_defence/views/self_defence_techniques.dart';
import 'package:self_defence/views/self_defence_tips.dart';

class HomePage extends StatelessWidget {
  static const String id = "HomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/img1.jpg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            ),
            Align(              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                  elevation: 5.0,
                  color: Colors.white,
                  textColor: Colors.black,                  
                  onPressed: ()=> Navigator.pushNamed(context, SelfDefenceTips.id),
                  child: Text(
                    "Self Defence Tips",
                  ),
                  ),
                  RaisedButton(
                  elevation: 5.0,
                  color: Colors.white,
                  textColor: Colors.black,                  
                  onPressed: () => Navigator.pushNamed(context, SelfDefenceTechniques.id),
                  child: Text(
                    "Self Defence Techniques",
                  ),
                  ),
                  RaisedButton(
                  elevation: 5.0,
                  color: Colors.white,
                  textColor: Colors.black,                  
                  onPressed: (){},
                  child: Text(
                    "More...",
                  ),
                  ),
                  RaisedButton(
                  elevation: 5.0,
                  color: Colors.white,
                  textColor: Colors.black,                  
                  onPressed: (){},
                  child: Text(
                    "HelpLine",
                  ),
                  ),
                  

                ],
              ),
            )
        ],
        ),
    );
  }
}