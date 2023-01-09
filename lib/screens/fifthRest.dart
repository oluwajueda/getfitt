// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FifthRest extends StatefulWidget {
  const FifthRest({super.key});

  @override
  State<FifthRest> createState() => _FifthRestState();
}

class _FifthRestState extends State<FifthRest> with TickerProviderStateMixin {
  late AnimationController controller;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );
    controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () => {},
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Row(
                children: [
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(215, 60, 16, 1), width: 1),
                        color: Color.fromRGBO(215, 60, 16, 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(fontSize: 20.19, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(215, 60, 16, 1), width: 1),
                        color: Color.fromRGBO(215, 60, 16, 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "2",
                        style: TextStyle(fontSize: 20.19, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(215, 60, 16, 1),
                        ),
                        color: Color.fromRGBO(215, 60, 16, 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "3",
                        style: TextStyle(fontSize: 20.19, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(215, 60, 16, 1),
                        ),
                        color: Color.fromRGBO(215, 60, 16, 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "4",
                        style: TextStyle(
                          fontSize: 20.19,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(215, 60, 16, 1), width: 1),
                        color: Color.fromRGBO(215, 60, 16, 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "5",
                        style: TextStyle(fontSize: 20.19, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "6",
                        style: TextStyle(fontSize: 20.19, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "7",
                        style: TextStyle(fontSize: 20.19, color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Container(
                width: 99,
                height: 99,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(245, 245, 245, 1),
                    shape: BoxShape.circle),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Resting Period",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "+20s",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) => Text(
                              countText,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                  ),
                ),
              ),
              Text(
                "skip",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 10, 12),
              child: Text(
                'Up next 3/10',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Image.asset('assets/images/Rectangle.png'),
        ],
      ),
    );
  }
}
