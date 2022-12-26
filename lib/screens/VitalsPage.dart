// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class VitalsPage extends StatefulWidget {
//   const VitalsPage({super.key});

//   @override
//   State<VitalsPage> createState() => _VitalsPageState();
// }

// class _VitalsPageState extends State<VitalsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             leading: BackButton(color: Colors.black, onPressed: () => {}),
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             actions: [
//               IconButton(
//                   onPressed: () => {},
//                   icon: Icon(
//                     Icons.close,
//                     color: Colors.black,
//                   ))
//             ]),
//         body: FutureBuilder<QuerySnapshot>(
//             future: FirebaseFirestore.instance.collection("vitalsvalues").get(),
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return Text("It's Error!");
//               }

//               final List<DocumentSnapshot> documents = snapshot.data.docs;
//               return ListView(
//                   children: documents
//                       .map((doc) => Card(
//                             child: ListTile(
//                               title: Text(doc['Blood_Sugar']),
//                             ),
//                           ))
//                       .toList());
//             }));
//   }
// }
