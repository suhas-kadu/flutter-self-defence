import 'package:flutter/material.dart';
import 'package:self_defence/constants.dart';
import 'package:url_launcher/url_launcher.dart';


class HelpLine extends StatelessWidget {
  static const String id = "HelpLine";

  _makingPhoneCall(String url) async { 

  if (await canLaunch(url)) { 
    await launch(url); 
  } else { 
    throw 'Could not launch $url'; 
  } 
} 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HelpLine Numbers"),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:8.0),
        child: Column(
          children: [
            ListTile(
              onTap:()=> _makingPhoneCall('tel:1091'),
              title: Text("Women HelpLine"),
              trailing: Icon(Icons.call),
            ),
            ListTile(
              onTap: ()=> _makingPhoneCall('tel:100'),
              title: Text("Police"),
              trailing: Icon(Icons.call),
            ),
          ],
        ),
      ),
    );
  }
}
