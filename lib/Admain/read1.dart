
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_light/Admain/read.dart';
import 'package:travel_light/Admain/read2.dart';
import 'package:travel_light/screens/reservationn.dart';import '';
import '../login.dart';
import 'dell.dart';

class tUserName extends StatelessWidget {
  // final String documentId;

  tUserName();

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
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text('Welcome in Egypt  What would you like to find?',
                    style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                    ),),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: RaisedButton(color: Colors.indigoAccent,
                            child: Text('places',style: TextStyle(
                              fontSize: 10.0,
                            ),),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => UserName() ) );
                            },
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: RaisedButton(color: Colors.indigoAccent,
                            child: Text('resturants',style: TextStyle(
                              fontSize: 10.0,
                            ),),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => etUserName() ) );
                            },

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: RaisedButton(color: Colors.indigoAccent,
                            child: Text('about me',style: TextStyle(
                              fontSize: 10.0,
                            ),),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => GetUserName() ) );
                            },
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: RaisedButton(color: Colors.indigoAccent,
                            child: Text('logout',style: TextStyle(
                              fontSize: 10.0,
                            ),),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ) );
                            },
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('hotel')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else
                        return ListView(
                          children: snapshot.data!.docs.map((doc) {
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(

                                  builder: (_) => Reservation(doc['name'],doc['description']

                                  ),
                                ),
                              ),
                              child: Card(
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
                                    Image(
                                      height: 180.0,
                                      width: 220.0,
                                      image: NetworkImage(doc.data()['imgUrl']),
                                      fit: BoxFit.cover,
                                    ),
                                    Text(
                                      doc['name'],
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      doc['address'],
                                      style: TextStyle(

                                        fontSize: 12.0,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),

                                    SizedBox(height: 4.0),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        '\$${doc['price']} / night',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),

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

