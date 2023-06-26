import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final String title;

  @override
  const LoginPage({super.key, required this.title});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _firebaseAuth = FirebaseAuth.instance;

  // late final TextEditingController _email;
  // late final TextEditingController _password;
  String _email = " ";
  String _password = " ";

  // @override
  // void initState() {
  //   _email = TextEditingController();
  //   _password = TextEditingController();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _email.dispose();
  //   _password.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Email'),
                onChanged: (value) async {
                  setState(() {});
                  _email = value.trim();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Password'),
                onChanged: (value) async {
                  setState(() {
                    _password = value.trim();
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Login'),
                  // color: Colors.blue,
                  // textColor: Colors.white,
                  // elevation: 7.0,
                  onPressed: () {
                    _firebaseAuth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.of(context).pushReplacementNamed('/homepage');
                  },
                ),
                ElevatedButton(
                  child: const Text('Register'),
                  // color: Colors.blue,
                  // textColor: Colors.white,
                  // elevation: 7.0,
                  onPressed: () {
                    _firebaseAuth.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.of(context).pushReplacementNamed('/homepage');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _login() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: _email, password: _password);
      Navigator.of(context).pushReplacementNamed('/homepage');
    } catch (e) {
      print(e);
    }
  }
}
