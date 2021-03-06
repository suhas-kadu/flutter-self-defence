import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:self_defence/constants.dart';

class HomeButton extends StatelessWidget {
  const HomeButton(
      {Key key,
      @required this.route,
      @required this.title,
      @required this.widget})
      : super(key: key);

  final String route;
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(      
      openElevation: 0.0,
      closedElevation: 0.0,
      closedColor: Colors.transparent,
      openBuilder: (context, action) {
        return widget;
      },
      closedBuilder: (context, action) {
        action() {
          Navigator.pushNamed(context, route);
        }

        return RaisedButton(
          elevation: 5.0,
          color: Colors.white,
          textColor: Colors.black,
          onPressed: () => action(),
          child: Text(
            title,
            style: kBoldText.copyWith(fontWeight: FontWeight.normal),
          ),
        );
      },
    );
  }
}
