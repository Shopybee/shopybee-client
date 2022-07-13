import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopybee/services/firebase/auth_services.dart';
import 'package:shopybee/services/profile_custom_icons.dart';
import 'package:shopybee/uitls/device_size.dart';

class ProfileScreen extends StatelessWidget {
  final Authservice _auth = Authservice(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Color(0xffb347),
            Color(0xffbffcc33),
          ])),
      height: displayHeight(context) * 1.0,
      width: displayWidth(context) * 1.0,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                    Color(0xffb347),
                    Color(0xffbffcc33),
                  ])),
              height: displayHeight(context) * 0.4,
              width: displayWidth(context) * 1.0,
              child: Column(
                children: [
                  SizedBox(height: displayHeight(context) * 0.05),
                  Container(
                    //   color: Colors.red,
                    height: displayHeight(context) * 0.08,
                    child: Row(
                      children: [
                        SizedBox(
                          width: displayWidth(context) * 0.3,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: displayWidth(context) * 0.02),
                              child: Text(
                                "Profile",
                                style: TextStyle(
                                    fontSize: displayWidth(context) * 0.045,
                                    //   fontStyle: ,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          width: displayWidth(context) * 0.6,
                        ),
                        SizedBox(
                          width: displayWidth(context) * 0.1,
                          // add more icon !!
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: displayHeight(context) * 0.015),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: displayHeight(context) * 0.075,
                    child: Image(image: AssetImage("")),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: displayHeight(context) * 0.01,
                      ),
                      Text("Subhojeet Sahoo"),
                      SizedBox(
                        height: displayHeight(context) * 0.01,
                      ),
                      Text("9876543210"),
                    ],
                  )
                ],
              )),

          // .............................. //
          // Bottom container !!

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: Colors.white,
            ),
            width: displayWidth(context) * 1.0,
            height: displayHeight(context) * 0.4421,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      //  color: Colors.yellow,
                    ),
                    height: displayHeight(context) * 0.08,
                    width: displayWidth(context),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Text("Account Overview"),
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                    width: displayWidth(context),
                  ),
                  Container(
                    height: displayHeight(context) * 0.08,

                    width: displayWidth(context),

                    child: Row(
                      children: [
                        SizedBox(width: displayWidth(context) * 0.05),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          width: displayWidth(context) * 0.175,
                          child: Icon(
                            ProfileCustomIcons.addresses,
                            size: displayHeight(context) * 0.08,
                          ),
                        ),
                        SizedBox(
                          width: displayWidth(context) * 0.05,
                        ),
                        Container(
                          height: displayHeight(context) * 0.08,
                          width: displayWidth(context) * 0.525,
                          //   color: Colors.red,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 20.0),
                            child: Text(" My Profile"),
                          ),
                        ),
                        Container(
                          width: displayWidth(context) * 0.2,
                          // color: Colors.black,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              color: Colors.grey,
                              Icons.arrow_forward_ios,
                            ),
                          ),
                        )
                      ],
                    ),
                    // color: Colors.yellow,
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                    width: displayWidth(context),
                  ),
                  Container(
                    height: displayHeight(context) * 0.08,
                    //   color: Colors.yellow,
                    width: displayWidth(context),

                    child: Row(
                      children: [
                        SizedBox(width: displayWidth(context) * 0.05),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            //  color: Colors.blue,
                          ),
                          width: displayWidth(context) * 0.175,
                          child: Icon(
                            ProfileCustomIcons.orders,
                            size: displayHeight(context) * 0.06,
                          ),
                        ),
                        SizedBox(
                          width: displayWidth(context) * 0.05,
                        ),
                        Container(
                          height: displayHeight(context) * 0.08,
                          width: displayWidth(context) * 0.525,
                          //  color: Colors.red,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 20.0),
                            child: Text(" My Orders"),
                          ),
                        ),
                        Container(
                          width: displayWidth(context) * 0.2,
                          // color: Colors.black,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              color: Colors.grey,
                              Icons.arrow_forward_ios,
                            ),
                          ),
                        )
                      ],
                    ),
                    // color: Colors.yellow,
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                    width: displayWidth(context),
                  ),
                  Container(
                    height: displayHeight(context) * 0.08,
                    // color: Colors.yellow,

                    child: Row(
                      children: [
                        SizedBox(width: displayWidth(context) * 0.05),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          width: displayWidth(context) * 0.175,
                        ),
                        SizedBox(
                          width: displayWidth(context) * 0.05,
                        ),
                        Container(
                          height: displayHeight(context) * 0.08,
                          width: displayWidth(context) * 0.525,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 20.0),
                            child: Text("Refunds"),
                          ),
                        ),
                        Container(
                          width: displayWidth(context) * 0.2,
                          // color: Colors.black,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              color: Colors.grey,
                              Icons.arrow_forward_ios,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                    width: displayWidth(context),
                  ),
                  Container(
                    height: displayHeight(context) * 0.08,

                    width: displayWidth(context),
                    /* decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            color: Colors.yellow,
                          ),*/
                    child: Row(
                      children: [
                        SizedBox(width: displayWidth(context) * 0.05),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          width: displayWidth(context) * 0.175,
                        ),
                        SizedBox(
                          width: displayWidth(context) * 0.05,
                        ),
                        Container(
                          height: displayHeight(context) * 0.08,
                          width: displayWidth(context) * 0.525,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 20.0),
                            child: Text("Change Password"),
                          ),
                        ),
                        Container(
                          width: displayWidth(context) * 0.2,
                          // color: Colors.black,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              color: Colors.grey,
                              Icons.arrow_forward_ios,
                            ),
                          ),
                        )
                      ],
                    ),
                    // color: Colors.yellow,
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                    width: displayWidth(context),
                  ),
                  Container(
                    height: displayHeight(context) * 0.08,

                    width: displayWidth(context),

                    child: Row(
                      children: [
                        SizedBox(width: displayWidth(context) * 0.05),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          width: displayWidth(context) * 0.175,
                        ),
                        SizedBox(
                          width: displayWidth(context) * 0.05,
                        ),
                        Container(
                          height: displayHeight(context) * 0.08,
                          width: displayWidth(context) * 0.525,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 20.0),
                            child: Text("Change Language"),
                          ),
                        ),
                        Container(
                          width: displayWidth(context) * 0.2,
                          // color: Colors.black,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              color: Colors.grey,
                              Icons.arrow_forward_ios,
                            ),
                          ),
                        )
                      ],
                    ),
                    // color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
