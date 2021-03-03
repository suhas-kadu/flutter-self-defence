import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
                  onPressed: (){},
                  child: Text(
                    "Self Defence Tips",
                  ),
                  ),
                  RaisedButton(
                  elevation: 5.0,
                  color: Colors.white,
                  textColor: Colors.black,                  
                  onPressed: (){},
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