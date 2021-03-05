import 'package:flutter/material.dart';
import 'package:self_defence/views/helpline.dart';
import 'package:self_defence/views/self_defence_techniques.dart';
import 'package:self_defence/views/self_defence_tips.dart';
import 'package:self_defence/widgets/home_button.dart';

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
                SizedBox(height: 110,),
                HomeButton(title: "Self Defence Tips", route: SelfDefenceTips.id,),
                HomeButton(title: "Self Defence Techniques", route: SelfDefenceTechniques.id),
                HomeButton(title: "Help", route: HelpLine.id)
              ],
            ),
          )
        ],
      ),
    );
  }
}
