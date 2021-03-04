import 'package:flutter/material.dart';
import 'package:self_defence/views/helpline.dart';
import 'package:self_defence/views/self_defence_techniques.dart';
import 'package:self_defence/views/self_defence_tips.dart';
import 'package:self_defence/views/technique_demo.dart';
import 'views/home_page.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.id,
      routes: <String, WidgetBuilder>{
        
        HomePage.id: (context) => HomePage(),
        SelfDefenceTips.id: (context) => SelfDefenceTips(),
        SelfDefenceTechniques.id: (context) => SelfDefenceTechniques(),
        TechniqueDemo.id: (context) => TechniqueDemo(),
        HelpLine.id: (context) => HelpLine(),
      },
      // home: HomePage(),
    );
  }
}
