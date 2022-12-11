import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getfitts/screens/Information.dart';
import 'package:getfitts/screens/Login.dart';

class GetNotification extends StatefulWidget {
  const GetNotification({super.key});

  @override
  State<GetNotification> createState() => _GetNotificationState();
}

class _GetNotificationState extends State<GetNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()))
            },
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Get notified about important stuffs",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "You can adjust these settings later",
              style:
                  TextStyle(fontSize: 14, color: Color.fromRGBO(85, 85, 85, 1)),
            ),
            SizedBox(
              height: 55,
            ),
            Text(
              "We will notify you when",
              style: TextStyle(
                  fontSize: 24,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Row(children: <Widget>[
                  new Container(
                    child: new Image.asset('assets/images/mark.png'),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  new Container(
                    child: Text("Your daily exercise is ready"),
                  )
                ])
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Row(children: <Widget>[
                  new Container(
                    child: new Image.asset('assets/images/mark.png'),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  new Container(
                    child: Text("Its time to do your exercise"),
                  )
                ])
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Row(children: <Widget>[
                  new Container(
                    child: new Image.asset('assets/images/mark.png'),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  new Container(
                    child: Text("When you complete your exercise"),
                  )
                ])
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Row(children: <Widget>[
                  new Container(
                    child: new Image.asset('assets/images/mark.png'),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  new Container(
                    child: Text("when you forget to do your exercise"),
                  )
                ])
              ],
            ),
            SizedBox(
              height: 250,
            ),
            SizedBox(
              width: 350,
              height: 45,
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(215, 60, 16, 1)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Information()));
                    },
                    child: Text(
                      "Enable Notification",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Center(child: Text("Later"))
          ],
        ),
      ),
    );
  }
}
