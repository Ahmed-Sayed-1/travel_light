import 'package:flutter/material.dart';
import 'package:travel_light/Admain/addhotel.dart';
import 'package:travel_light/Admain/read2.dart';
import '../login.dart';
import 'addresturant.dart';
import 'data.dart';

class Choice extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(

      body: SafeArea(

        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 659.4,
                width: 500,
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Column(
                    children: [
                      RaisedButton(color: Colors.indigoAccent,
                        child: Text('add place',style: TextStyle(
                          fontSize: 30.0,
                        ),),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home() ) );
                        },
                      ),
                      RaisedButton(color: Colors.indigoAccent,
                        child: Text('Add Hotel',style: TextStyle(
                          fontSize: 30.0,
                        ),),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddHotel() ) );
                        },
                      ),
                      RaisedButton(color: Colors.indigoAccent,
                        child: Text('Add resturant',style: TextStyle(
                          fontSize: 30.0,
                        ),),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Addresturant() ) );
                        },

                      ),
                  RaisedButton(color: Colors.indigoAccent,
                    child: Text('Show as user',style: TextStyle(
                      fontSize: 30.0,
                    ),),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserName() ) );
                    },
                  ),
                      RaisedButton(color: Colors.indigoAccent,
                        child: Text('log out',style: TextStyle(
                          fontSize: 30.0,
                        ),),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ) );
                        },
                      )
                    ],
                  ),
                )

              ),

            ],
          ),
        ),
      ),
    );
  }

}