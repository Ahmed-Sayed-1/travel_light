import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late String s1,s2,s3,s4,s5,s6,s7,s8,s9;


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
                  s1=value;
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
                  s2=value;
                  print(s2);
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your country',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "country is required";
                  }
                  print(value.toString());
                  s3=value;
                  print(s3);
                  return null;
                },
              ),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your name country',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name is required";
                  }
                  s4=value;
                  print(s4);
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your name type',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return " type is required";
                  }
                  s5=value;
                  print(s5);
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter the Hour ',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Hour is required description";
                  }
                  s6=value;
                  print(s6);
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your price',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "price is required description";
                  }
                  s7=value;
                  print(s7);
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your rate',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "rate is required description";
                  }
                  s8=value;
                  print(s8);
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your description',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "rate is required description";
                  }
                  s9=value;
                  print(s9);
                  return null;
                },
              ),


              RaisedButton(
                child: Text('Send'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    FirebaseFirestore.instance.collection("places").add({
                      'imageUrl':s1,
                      'name':s2,
                      'country':s3,
                      'type':s4,
                      'from':s5,
                      'to':s6,
                      'price':s7,
                      'rate':s8,
                      'description':s9

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
