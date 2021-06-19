import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_defence/constants.dart';
import 'package:self_defence/views/helpline.dart';
import 'package:self_defence/views/login_screen.dart';
import 'package:self_defence/views/registeration_screen.dart';
import 'package:self_defence/views/self_defence_techniques.dart';
import 'package:self_defence/views/self_defence_tips.dart';
import 'package:self_defence/views/technique_demo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'views/home_page.dart';


Future<void> main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Self Defence ",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(
            
        Theme.of(context).textTheme,
      )),
      initialRoute: HomePage.id,
      routes: <String, WidgetBuilder>{
        HomePage.id: (context) => HomePage(),
        SelfDefenceTips.id: (context) => SelfDefenceTips(),
        SelfDefenceTechniques.id: (context) => SelfDefenceTechniques(),
        TechniqueDemo.id: (context) => TechniqueDemo(),
        HelpLine.id: (context) => HelpLine(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterationScreen.id: (context) => RegisterationScreen()
      },
      // home: HomePage(),
    );
  }
}
