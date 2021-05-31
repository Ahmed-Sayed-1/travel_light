

import 'package:flutter/material.dart';
import 'package:travel_light/Admain/read2.dart';



class Done extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(

      body: SafeArea(

        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Image(height: 600,
                  image: NetworkImage('https://www.wishesmsg.com/wp-content/uploads/enjoy-your-trip.jpg'
                  ),
                ),
              ),
              RaisedButton(
                child: Text('HomeScreen'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserName() ) );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

}