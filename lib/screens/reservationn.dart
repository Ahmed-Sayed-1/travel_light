import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'done.dart';

class Reservation extends StatefulWidget {
  late String s1,s2;
  Reservation(this.s1,this.s2);
  @override
  _Reservation createState() => _Reservation(s1,s2);
}

class _Reservation extends State<Reservation> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late String s1,s2,s3,s4,s5,s6,s7;

  _Reservation(this. s5, this. s6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Bocking'),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child:Text(s6,
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
                  icon: Icon (Icons.people_alt_rounded),
                  hintText: 'number of people ',

                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "people number is  required";
                  }
                  s1=value;
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon (Icons.home_rounded),
                  hintText: 'number of room you want ',

                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "room  number is  required";
                  }
                  s2=value;
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon (Icons.date_range),
                  hintText: 'chek in date ',

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
                  icon: Icon (Icons.date_range),
                  hintText: 'chek out date',

                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "people number is  required";
                  }
                  s4=value;
                  return null;
                },
              ),

              RaisedButton(
                child: Text('Send'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    //save data local or go to server
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Done() ) );
                    FirebaseFirestore.instance.collection('chek').add({
                      "name":s5,
                      "email":FirebaseAuth.instance.currentUser.email,
                      "people":s3,
                      "chek_in":s1,
                      'chek_out':s4,
                      "rooms":s2
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