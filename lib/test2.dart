import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  const Test2({super.key});

  @override
  Widget build(BuildContext context) {
    // final media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Column(
            children: [
              Text("${FirebaseAuth.instance.currentUser!.displayName}"),
              Text("${FirebaseAuth.instance.currentUser!.email}"),
              Text("${FirebaseAuth.instance.currentUser!.phoneNumber}"),
            ],
          ),
        ));
  }
}
