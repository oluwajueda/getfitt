import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Vitals extends StatelessWidget {
  const Vitals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: BackButton(
              color: Colors.black,
              onPressed: () => {},
            ),
            actions: [
              IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ))
            ]),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text("Record your vitals",
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "We are collecting your vitals to make better decision for you. Note that this is optional and information shared here is completely private",
                style: TextStyle(
                    fontSize: 14, color: Color.fromRGBO(85, 85, 85, 1)),
              ),
            ],
          ),
        ));
  }
}
