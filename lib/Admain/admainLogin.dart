import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../login.dart';
import 'chooise.dart';



class AdmainLoginScreen extends StatefulWidget{
  @override
  _AdmainLoginScreen createState() => _AdmainLoginScreen();
}

class _AdmainLoginScreen extends State<AdmainLoginScreen> {

  void initState()
  {
    super.initState();
  }


  final _formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        automaticallyImplyLeading: false,
        title: Text('Login To My Account'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formkey,
            child: SingleChildScrollView(
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
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text('Login',style: TextStyle(color: Colors.white),),
                    onPressed: () async {
                      if(_formkey.currentState!.validate()){

                        var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);

                        if(_emailcontroller.text=='ahmed@gmail.com'){
                          // pushReplacement
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Choice()),
                          );

                        }else{

                          print('you are not admin ');
                        }
                      }
                    },
                  ),

                  RaisedButton(
                    color: Colors.blue,
                    child: Text('log in as user ',style: TextStyle(color: Colors.white),),
                    onPressed: () async {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ) );
                    },
                  )


                ],
              ),
            )
        ),
      ),
    );
  }



}