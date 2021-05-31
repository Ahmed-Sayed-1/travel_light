import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



import 'done.dart';

class DestinationScreen extends StatefulWidget {
  late String s1,s2;
  DestinationScreen(this.s1,this.s2);
  @override
  _DestinationScreen createState() => _DestinationScreen(s1,s2);
}

class _DestinationScreen extends State<DestinationScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late String s1,s2,s3,s4,s5;

  _DestinationScreen(this. s1, this. s2);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Hotel'),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child:Text(s2,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ) ,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon (Icons.hotel),
                  hintText: 'number of people ',

                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "people number is  required";
                  }
                  s3=value;
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon (Icons.lock_clock),
                  hintText: 'at what time ',

                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "time is  required";
                  }
                  s4=value;
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon (Icons.date_range),
                  hintText: 'at what day ',

                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "day is  required";
                  }
                  s5=value;
                  return null;
                },
              ),

              RaisedButton(
                child: Text('Send'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Done()),

                    );
                    FirebaseFirestore.instance.collection('rest').add({
                      "name":s1,
                      "email":FirebaseAuth.instance.currentUser.email,
                      "people":s3,
                      "day":s5,
                      "time":s4,

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