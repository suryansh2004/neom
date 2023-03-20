import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neom/firebase_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await FirebaseServices.signInwithGoogle();
              if (FirebaseAuth.instance.currentUser != null) {
                Navigator.of(context).pushReplacementNamed("/");
              }
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blue;
                    } else {
                      return Colors.white;
                    }
                  },
                ),
                maximumSize: MaterialStateProperty.all<Size?>(Size(
                    MediaQuery.of(context).size.width * .8,
                    MediaQuery.of(context).size.shortestSide))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/471px-Google_%22G%22_Logo.svg.png",
                      width: 30.0,
                      height: 30.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      "Login with Gmail",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
