import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



import 'done.dart';

// ignore: must_be_immutable
class BockingScreen extends StatefulWidget {
  String ds,ds2;
  BockingScreen(this.ds,this.ds2);
  @override
  _BockingScreen createState() => _BockingScreen(ds,ds2);
}

class _BockingScreen extends State<BockingScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var result=  FirebaseAuth.instance.currentUser;
  late String s1,s2,s3,s4,s5;

  _BockingScreen(this.s4,this.s5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Booking'),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(child: Text(s5,
                style: TextStyle(
                fontSize: 15.0,
                  color: Colors.grey,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
              ),
              ),

              TextFormField(
                decoration: InputDecoration(
                  icon: Icon (Icons.approval),
                  hintText: 'number of tickets ',

                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "tickets number is  required";
                  }
                  s1=value;
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon (Icons.double_arrow),
                  hintText: 'enter the day  ',

                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "day is  required";
                  }
                  s2=value;
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon (Icons.date_range),
                  hintText: 'enter the date   ',

                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "date is  required";
                  }
                 s3=value;
                  return null;
                },
              ),

              RaisedButton(
                child: Text('Send'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    //save data local or go to server

                    Navigator.push(context, MaterialPageRoute(builder: (context) => Done() ) );
                    FirebaseFirestore.instance.collection('about').add({
                      "day":s2,
                      "email":FirebaseAuth.instance.currentUser.email,
                      "n":s3,
                      "booked":s1,
                      'place':s4
                    });

                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}