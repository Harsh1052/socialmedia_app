import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:socialmedia_app/screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image(
                height: MediaQuery.of(context).size.height / 3.5,
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/login_background.jpg',
                ),
              ),
              Text(
                'Instagram',
                style: TextStyle(
                    letterSpacing: 5.0,
                    fontFamily: 'Lobster',
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: TextField(
                  selectionHeightStyle: BoxHeightStyle.strut,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Username',
                      fillColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.blue),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: TextField(
                  selectionHeightStyle: BoxHeightStyle.strut,
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Password',
                      fillColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.blue),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue,
                  ),
                  child: FlatButton(
                    minWidth: double.infinity,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: Text('Login'),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    color: Colors.blue,
                    child: FlatButton(
                      minWidth: double.infinity,
                      onPressed: () {},
                      child: Text('New User? SignUp'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
