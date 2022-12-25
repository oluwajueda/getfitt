import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VitalsPage extends StatefulWidget {
  const VitalsPage({super.key});

  @override
  State<VitalsPage> createState() => _VitalsPageState();
}

class _VitalsPageState extends State<VitalsPage> {
  final Stream<QuerySnapshot> _userStream =
      FirebaseFirestore.instance.collection('vitalvalues').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: BackButton(color: Colors.black, onPressed: () => {}),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ))
            ]),
        body: StreamBuilder<QuerySnapshot>(
          stream: _userStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return ListTile(title: Text(data['Blood Sugar']));
              }).toList(),
            );
          },
        ));
  }
}
