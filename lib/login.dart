import 'package:travel_light/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Admain/chooise.dart';
import 'Admain/read2.dart';


class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
        title: Text('Login To My Account'),
        automaticallyImplyLeading: false,
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
                  child: Text('Login',style: TextStyle(color: Colors.white),),
                  onPressed: () async {
                    if(_formkey.currentState!.validate()){

                      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);

                      if(result != null){
                        // pushReplacement
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => UserName()),
                        );

                      }else{
                        print('user not found');
                      }
                    }
                  },
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text('Register New Account',style: TextStyle(color: Colors.white),),
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen() ) );
                  },
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text('Login as Admin',style: TextStyle(color: Colors.white),),
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


              ],
            )
        ),
      ),
    );
  }



}