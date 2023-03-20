import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:neom/firebase_options.dart';
import 'package:neom/screens/home.dart';
import 'package:neom/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Neom());
}

class Neom extends StatelessWidget {
  const Neom({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        Navigator.of(context).pushReplacementNamed("/");
      } else {
        Navigator.of(context).pushReplacementNamed("/login");
      }
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neom',
      theme: ThemeData.dark(),
      routes: {
        "/": (context) => const HomeScreen(),
        "/login": (context) => const LoginScreen(),
      },
      initialRoute: FirebaseAuth.instance.currentUser != null ? "/" : "/login",
    );
  }
}
