import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VitalsPage extends StatefulWidget {
  const VitalsPage({super.key});

  @override
  State<VitalsPage> createState() => _VitalsPageState();
}

class _VitalsPageState extends State<VitalsPage> {
  final db = FirebaseFirestore.instance;

  Widget _buildList(QuerySnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.docs.length,
      itemBuilder: (context, index) {
        final doc = snapshot.docs[index];

        return ListTile(
          title: Text(doc["Blood Pressure"]),
        );
      },
    );
  }

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
          stream: db.collection('vitalsvalues').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final List<DocumentSnapshot> documents = snapshot.data!.docs;

            return ListView(
              children: documents
                  .map((doc) => Card(
                        child: ListTile(
                          title: Text(doc['Blood Pressure']),
                        ),
                      ))
                  .toList(),
            );
          }),
    );
  }
}
