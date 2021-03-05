import 'package:flutter/material.dart';
import 'package:self_defence/views/technique_demo.dart';
import '../constants.dart';
import '../model/technique_model.dart';

class TechniqueWidget extends StatelessWidget {
  const TechniqueWidget(
      {Key key, @required List<Technique> techniques, @required this.index})
      : _techniques = techniques,
        super(key: key);

  final List<Technique> _techniques;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 1.5,
        borderOnForeground: true,
        child: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TechniqueDemo(
                        technique: _techniques[index],
                      ))),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 16.0, top: 8.0, left: 8.0, bottom: 8.0),
                child: Image.asset(_techniques[index].imgUrl,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 10.5,
                    width: MediaQuery.of(context).size.width / 3.5),
              ),
              Flexible(
                child: Text(
                  _techniques[index].title,
                  style: kBoldText,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
