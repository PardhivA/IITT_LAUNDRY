//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _firebaseAuth = FirebaseAuth.instance;

  String _email = " ";
  String _password = " ";
  String _confirmPassword = " ";
  String _name = " ";
  String _surname = " ";
  String _phoneNumber = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registration'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Confirm Password'),
              onChanged: (value) {
                setState(() {
                  _confirmPassword = value.trim();
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Name'),
              onChanged: (value) {
                setState(() {
                  _name = value.trim();
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Surname'),
              onChanged: (value) {
                setState(() {
                  _surname = value.trim();
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Phone Number'),
              onChanged: (value) {
                setState(() {
                  _phoneNumber = value.trim();
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                _register();
              },
              child: const Text('Register'),
            ),
          ]),
        ));
  }

  void _register() async {
    final user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: _email, password: _password);
    if (context.mounted) {
      if (user != null) {
        Navigator.pushNamed(context, '/home');
      } else if (_password != _confirmPassword) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text('Passwords do not match'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'))
                ],
              );
            });
      } else if (!_email.contains('@')) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text('Please enter a valid email address'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'))
                ],
              );
            });
        if (_password.length < 8) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content:
                      const Text('Password must be at least 6 characters long'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'))
                  ],
                );
              });
        }
      }
    }
  }
}
