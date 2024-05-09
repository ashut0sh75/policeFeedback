import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:police_feedback/homef.dart'; // Assuming this is your home screen
import 'package:police_feedback/navscreen.dart';
import 'package:police_feedback/newButton.dart'; // Assuming this is your button widget

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            // Assuming you have a form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Your form fields here
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      } else if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 360,
              child: newButton(
                onPressed: () {
                  _register();
                },
                text: 'Register',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _usernameController.text,
          password: _passwordController.text,
        );

        // User is registered, now store additional data in Firestore
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': _usernameController.text,
          // Add other user data here if needed
        });

        // Navigate to another screen if needed
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NavScreen()), // Replace Home() with your actual home screen
        );
      } catch (e) {
        print("Error occurred: $e");
        // Handle error here
      }
    }
  }
}
