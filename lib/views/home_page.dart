import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:self_defence/constants.dart';
import 'package:self_defence/views/helpline.dart';
// import 'package:self_defence/views/login_screen.dart';
import 'package:self_defence/views/self_defence_techniques.dart';
import 'package:self_defence/views/self_defence_tips.dart';
import 'package:self_defence/widgets/home_button.dart';

User loggedInUser;
final _auth = FirebaseAuth.instance;

class HomePage extends StatefulWidget {
  static const String id = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void getCurrentUser() async {
    try {
      // final user = await _auth.currentUser;
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;

        print(loggedInUser.email);
      }
    } catch (e) {
      print("Exception:$e");
      throw (e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

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
          // Padding(
          //   padding: const EdgeInsets.all(32.0),
          //   child: Align(
          //       alignment: Alignment.topRight,
          //       child: InkWell(
          //         onTap: () {
          //           _auth.signOut();
          //           Constants.prefs.setBool("loggedIn", false);
          //           emailController.clear();
          //           passwordController.clear();
          //           Navigator.pushReplacementNamed(context, LoginScreen.id);
          //         },
          //         child: Container(
          //             decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 borderRadius: BorderRadius.circular(5)),
          //             padding: const EdgeInsets.all(8.0),
          //             margin: const EdgeInsets.all(8.0),
          //             child: Text("Logout", style: TextStyle(fontWeight: FontWeight.bold))),
          //       )),
          // ),
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 110,
                ),
                HomeButton(
                  title: "Self Defence Tips",
                  route: SelfDefenceTips.id,
                  widget: SelfDefenceTips(),
                ),
                HomeButton(
                  title: "Self Defence Techniques",
                  route: SelfDefenceTechniques.id,
                  widget: SelfDefenceTechniques(),
                ),
                HomeButton(
                  title: "Help",
                  route: HelpLine.id,
                  widget: HelpLine(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
