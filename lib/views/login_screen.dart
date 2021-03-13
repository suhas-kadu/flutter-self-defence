import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:self_defence/views/home_page.dart';
import 'package:self_defence/views/registeration_screen.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  static const String id = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;

  singIn() async {
    if (email == null || password == null) {
      print("Inavlid credentials");
      Fluttertoast.showToast(
        msg: "Invalid Credentials",
        textColor: Colors.white,
        backgroundColor: Colors.teal,
      );
    } else {
      setState(() {
        showSpinner = true;
      });
      try {
        final newUser = await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        if (newUser.user.emailVerified) {
          Navigator.pushReplacementNamed(context, HomePage.id);
          print("User Logged In succesfully");
        }
        if (newUser == null) {
          print("Invalid Credentials");
        }
        setState(() {
          showSpinner = false;
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found") {
          Fluttertoast.showToast(msg: "No user found for that email");
        } else if (e.code == "wrong-password") {
          Fluttertoast.showToast(msg: "Wrong Password");
        } else {
          Fluttertoast.showToast(msg: "Something went wrong\nTry Again!");
        }
        setState(() {
          showSpinner = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome back!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvJrKA8QKeRXscTiorh7qUwn_IzARVc3WiQA&usqp=CAU"),
              ),
              SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: emailController,
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: passwordController,
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          GestureDetector(
              onTap: singIn,
              child: Container(
                  // height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(5.0)),
                  width: double.infinity,
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account ?",
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, RegisterationScreen.id);
                  },
                  child: Text(
                    " Create",
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
