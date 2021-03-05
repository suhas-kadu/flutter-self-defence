import 'package:flutter/material.dart';
import 'package:self_defence/constants.dart';


class HomeButton extends StatelessWidget {
  const HomeButton({
    Key key, @required this.route,@required this.title,
  }) : super(key: key);

  final String route;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 5.0,
      color: Colors.white,
      textColor: Colors.black,
      onPressed: () =>
          Navigator.pushNamed(context, route),
      child: Text(
        title, style: kBoldText.copyWith(fontWeight: FontWeight.normal),
      ),
    );
  }
}
