import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_light/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RegisterScreen extends StatefulWidget{
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void initState()
  {
    super.initState();
  }


  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose()
  {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Register New Account'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please Fill Email Input';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please Fill Password Input';
                    }
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 25,
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text('Register New Account',style: TextStyle(color: Colors.white),),
                  onPressed: () async{
                    if(_formkey.currentState!.validate()){
                      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);

                      if(result != null)
                      {
                        FirebaseFirestore.instance.collection("users").add({
                          "email":_emailcontroller.text,
                          "password": _passwordcontroller.text,


                        }).then((value) {
                          print(value.id);
                        });

                        //   var userInfo = FirebaseFirestore.instance.collection('users').doc().set({
                        //   'email':result.
                        //  });
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );

                      }else{
                        print('please try later');
                      }
                    }
                  },
                )
              ],
            )
        ),
      ),
    );
  }

}
