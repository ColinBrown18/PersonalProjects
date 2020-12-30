import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:organize_me/Layouts.dart';
import 'package:organize_me/main.dart';
import 'package:organize_me/Login/SignUp.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _formKey,
      color: Colors.white,
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(0, 40, 0, 0)),
          DesignCard(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Log In",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )
                  ],
                )
              ],
            ),
          ),
          DesignCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: const EdgeInsets.all(0)),
                Text(
                  "Email:",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: "enter email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) =>
                        (value.isEmpty) ? "Invalid Username" : null,
                  ),
                ),
                Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 0)),
                Text(
                  "Password:",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        labelText: "enter password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) =>
                        (value.isEmpty) ? "Invalid Password" : null,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: RaisedButton(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text(""),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: RaisedButton(
                        child: Text(
                          "Log In",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
