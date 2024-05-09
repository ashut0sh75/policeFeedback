import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:police_feedback/Login.dart';
import 'package:police_feedback/Register.dart';
import 'package:police_feedback/customButton.dart';
import 'package:police_feedback/navscreen.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({super.key});

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:  25, horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                Container(
                  height: 400,
                  width: 300,
                  child: Image.asset(
                    "assets/wel.png",
                    height: 300,
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.center,
                  child:  Text(
                    "Stay vigilant! Your digital neighborhood is under our watch.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //CustomButton
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>  Register(),
                      ),
                      );
                    },
                    text: "Get Started",
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    child: Text("Already registered, click here to sign in",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                        ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>  Login(),
                      ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
