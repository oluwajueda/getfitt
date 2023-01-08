// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getfitts/screens/ExerciseScreen.dart';

class FirstExplainer extends StatefulWidget {
  const FirstExplainer({super.key});

  @override
  State<FirstExplainer> createState() => _FirstExplainerState();
}

class _FirstExplainerState extends State<FirstExplainer> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset("assets/images/exercise1.jpg"),
      SizedBox(
        height: 15,
      ),
      Container(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
          child: Text(
            'Warm up',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 0),
        child: Text(
          "Lorem ipsum dolor sit amet consectetur. Egestas praesent neque curabitur urna nunc facilisi cursus. Elit lorem facilisis quis quisque faucibus consectetur felis. Purus odio eget lacinia elit dui non purus. Ut diam iaculis diam feugiat ornare proin a non ullamcorper. Lacus cursus consequat sit aliquam magnis purus viverra purus orci. Amet risus sem facilisis suspendisse quam tortor dui. Malesuada cursus neque enim risus. Consequat scelerisque et adipiscing diam sit cursus aliquam cursus. Sapien amet nec mattis ultricies. Neque lacus a nibh tincidunt. Blandit dui duis sit at in molestie duis parturient dignissim.Morbi nec id id tincidunt consequat cursus velit id.Pretium cursus egestas ut sed. Varius fusce est ultricies pretium sit. Nec dolor donec pharetra et sit. A pharetra erat montes adipiscing magna ut. ",
        ),
      ),
      SizedBox(
        height: 25,
      ),
      SizedBox(
        width: 370,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ExerciseScreen()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(215, 60, 16, 1),
            textStyle: TextStyle(color: Colors.white, fontSize: 14),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(color: Colors.transparent)),
            padding: EdgeInsets.all(18),
          ),
          child: Text("Go back to exercise"),
        ),
      ),
    ]);
  }
}
