import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:self_defence/views/home_page.dart';
import 'package:self_defence/views/login_screen.dart';

class RegisterationScreen extends StatefulWidget {
  static const String id = "RegisterationScreen";

  @override
  _RegisterationScreenState createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  String email;
  String password;
  bool showSpinner = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: 
        Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome back!\n",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  password = value;
                },
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            GestureDetector(
                onTap:  () async {
                    // print("Email:$email\nPassword:$_password");
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
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(email: email, password: password
                                );
                        await newUser.user.sendEmailVerification();
                         if (newUser != null) {
                          Fluttertoast.showToast(
                            toastLength: Toast.LENGTH_LONG,
                            msg:
                                  "An email verification link has been sent to your account\nPlease verify your email");

                          Navigator.pushNamed(context, HomePage.id);
                        }
                        
                        setState(() {
                          showSpinner = false;
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          Fluttertoast.showToast(
                              msg: "The password provided is too weak");
                        } else if (e.code == 'email-already-in-use') {
                          Fluttertoast.showToast(
                              msg: "The account already exists for that email");
                        } else {
                          Fluttertoast.showToast(msg: "Something Went Wrong");
                        }
                        setState(() {
                          showSpinner = false;
                        });

                      }}},
                      
                      
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
                      "Register",
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
                  "Already have an account ?",
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, LoginScreen.id);
                    },
                    child: Text(
                      " Login",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            )
          ],
        ),
      
    ));
  }
}
