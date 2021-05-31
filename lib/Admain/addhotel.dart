import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddHotel extends StatefulWidget {
  @override
  _AddHotel createState() => _AddHotel();
}

class _AddHotel extends State<AddHotel> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late String s1, s2, s3, s4,s5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('add Hotel'),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your imgUrl',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return " imgUrl is required";
                  }
                  print(value.toString());
                  s1 = value;
                  print(s1);
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name is required";
                  }
                  print(value.toString());
                  s2 = value;
                  print(s2);
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your address',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return " address is required";
                  }
                  print(value.toString());
                  s3 = value;
                  print(s3);
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter the price',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "price is required";
                  }
                  s4 = value;
                  print(s4);
                  return null;
                },
              ),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter the description',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "price is required";
                  }
                  s5 = value;
                  print(s5);
                  return null;
                },
              ),
              RaisedButton(
                child: Text('Send'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {

                    FirebaseFirestore.instance.collection("hotel").add({
                      'imgUrl': s1,
                      'name': s2,
                      'address': s3,
                      'price': s4,
                      'description':s5
                    }).then((value) {
                      print(value.id);
                    });

                    //save data local or go to server
                    scaffoldKey.currentState!.showSnackBar(SnackBar(
                      content: Text(
                        'Saving data local or on the server',
                      ),
                    ));
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
