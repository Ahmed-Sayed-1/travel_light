import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Addresturant extends StatefulWidget {
  @override
  _Addresturant createState() => _Addresturant();
}

class _Addresturant extends State<Addresturant> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late String s1, s2, s3, s4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('add place'),
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
                    return "imgUrl is required";
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
                    return "name is required";
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
                    return "address is required";
                  }
                  print(value.toString());
                  s3 = value;
                  print(s3);
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your description',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "address is required";
                  }
                  print(value.toString());
                  s4 = value;
                  print(s4);
                  return null;
                },
              ),


              RaisedButton(
                child: Text('Send'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    FirebaseFirestore.instance.collection("resturant").add({
                      'imageUrl': s1,
                      'name': s2,
                      'address': s3,
                      'description':s4

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
