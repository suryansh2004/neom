import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neom/firebase_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(FirebaseAuth.instance.currentUser?.photoURL ??
              "https://picsum.photos/200/200"),
          const SizedBox(
            height: 20,
          ),
          Text(FirebaseAuth.instance.currentUser?.displayName ?? "Anonymous"),
          const SizedBox(
            height: 5,
          ),
          Text(FirebaseAuth.instance.currentUser?.email ?? "noname@gmail.com"),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                await FirebaseServices.signOut();
                Navigator.of(context).pushReplacementNamed("/login");
              },
              child: const Text("LogOut")),
        ],
      )),
    );
  }
}
