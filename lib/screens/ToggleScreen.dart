import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  List<bool> _selections = List.generate(3, (_) => false);

  var TxtBold = FontWeight.normal;
  var TxtItalic = FontStyle.normal;
  var TxtUnder = TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleButtons(
          children: [
            Text('Exercise'),
            Text('Explainer'),
            Text('Last'),
          ],
          isSelected: _selections,
          onPressed: (int index) {
            setState(() {
              _selections[index] = !_selections[index];

              if (index == 0 && _selections[index]) {
                TxtBold = FontWeight.bold;
              } else if (index == 0 && !_selections[index]) {
                TxtBold = FontWeight.normal;
              }

              if (index == 1 && _selections[index]) {
                TxtItalic = FontStyle.italic;
              } else if (index == 1 && !_selections[index]) {
                TxtItalic = FontStyle.normal;
              }

              if (index == 2 && _selections[index]) {
                TxtUnder = TextDecoration.underline;
              } else if (index == 2 && !_selections[index]) {
                TxtUnder = TextDecoration.none;
              }
            });
          },
          color: Colors.teal,
          fillColor: Colors.deepPurple,
        ),
        Text(
          "This Is A Simple Text,Press Buttons Up And See What Gonna Happen",
          style: TextStyle(
            fontWeight: TxtBold,
            fontStyle: TxtItalic,
            decoration: TxtUnder,
          ),
        )
      ],
    );
  }
}
