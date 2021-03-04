import 'package:flutter/material.dart';
import 'package:self_defence/views/technique_demo.dart';
import '../constants.dart';
import '../model/technique_model.dart';


class TechniqueWidget extends StatelessWidget {
  const TechniqueWidget({
    Key key,
    @required List<Technique> techniques,
    @required this.index
  }) : _techniques = techniques, super(key: key);

  final List<Technique> _techniques;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 1.5,
        borderOnForeground: true,
        child: ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TechniqueDemo(
                        technique: _techniques[index],
                      ))),
          contentPadding: EdgeInsets.all(16),
          leading: Image.asset(_techniques[index].imgUrl),
          title: Text(
            _techniques[index].title,
            style: kBoldText,
          ),
        ),
      ),
    );
  }
}
