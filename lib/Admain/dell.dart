
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_light/Admain/read2.dart';
import 'package:travel_light/Carousel/Hotels.dart';
import 'package:travel_light/Carousel/places.dart';


class GetUserName extends StatelessWidget {
  // final String documentId;

  GetUserName();

  @override
  Widget build(BuildContext context) {
    String s1, s2, s3;
    //CollectionReference users = FirebaseFirestore.instance.collection('resturant');
    Firebase.initializeApp();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Row(
                  children: [ Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: RaisedButton(color: Colors.indigoAccent,
                      child: Text('about_Hotel',style: TextStyle(
                        fontSize: 10.0,
                      ),),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Name() ) );
                      },
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: RaisedButton(color: Colors.indigoAccent,
                        child: Text('about_restrant',style: TextStyle(
                          fontSize: 10.0,
                        ),),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => rest() ) );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: RaisedButton(color: Colors.indigoAccent,
                        child: Text('back',style: TextStyle(
                          fontSize: 20.0,
                        ),),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserName() ) );
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('about')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData ) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else
                        return ListView(
                          children: snapshot.data!.docs.map((doc) {
                            if(doc["email"]!=FirebaseAuth.instance.currentUser.email)
                            {
                              return Container(
                                child: Text(""),
                              );
                            }
                            else
                            return Card(
                              color: Colors.white,
                              shadowColor: Colors.white,
                              elevation: 8,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'you booked '+doc['booked']+'ticket',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'on date '+doc['n'],
                                    style: TextStyle(

                                      fontSize: 12.0,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    'in '+doc['place'],
                                    style: TextStyle(

                                      fontSize: 12.0,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Text(
                                      'at '+doc['day'],
                                      style: TextStyle(

                                        fontSize: 12.0,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ),



                                ],
                              ),

                            );
                          }).toList(),
                        );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



// return FutureBuilder<DocumentSnapshot>(
//   future: users.doc(documentId).get(),
//   builder:
//       (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//
//     if (snapshot.hasError) {
//       return Text("Something went wrong");
//     }
//
//     if (snapshot.hasData && !snapshot.data!.exists) {
//       return Text("Document does not exist");
//     }
//
//     if (snapshot.connectionState == ConnectionState.done) {
//       Map<String, dynamic> data = snapshot.data!.data();
//       s1=data['imgUrl'];
//       s2=data['address'];
//       s3=data["name"];
//       model.add(Model(imageUrl: s1, name: s3, address: s2));
//       return Text("Full Name: ${data['imgUrl']} ${data['address']} ${data["name"]}");
//     }
//
//     return Text("loading");
//   },
// );
}

