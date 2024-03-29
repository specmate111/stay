import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_store/screens/authentication/phoneauth_screen.dart';
import 'package:second_store/screens/login/location_screen.dart';
import 'package:second_store/services/phoneauth_services.dart';

class OTPScreen extends StatefulWidget {
  final String number, verId;
  OTPScreen({required this.number, required this.verId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool _loading = false;
  String error = '';

  PhoneAuthServices _services = PhoneAuthServices();

  var _text1 = TextEditingController();
  var _text2 = TextEditingController();
  var _text3 = TextEditingController();
  var _text4 = TextEditingController();
  var _text5 = TextEditingController();
  var _text6 = TextEditingController();

  Future<void> PhoneCredential(BuildContext context, String otp) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    debugPrint("ver id::::" + widget.verId);
    debugPrint("otp:::::" + otp);
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verId, smsCode: otp);
      final User? user = (await _auth.signInWithCredential(credential)).user;

      if (user != null) {
        //Signedin
        //first will add user data to firestore
        _services.addUser(context, user.uid);
        // Navigator.pushReplacementNamed(context, LocationScreen.id);
      } else {
        print('Login Failed');
        if (mounted) {
          setState(() {
            error = 'login failed';
          });
        }
      }
    } catch (e) {
      print(e.toString());
      if (mounted) {
        setState(() {
          error = 'Invalid Otp';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Login', style: TextStyle(color: Colors.black)),
        automaticallyImplyLeading: false, //to remove previous screen
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red.shade200,
              child: Icon(
                CupertinoIcons.person_alt_circle,
                size: 60,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Welcome Back',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: RichText(
                      text: TextSpan(
                          text: 'we sent  a 6-digit code to',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                          children: [
                        TextSpan(
                          text: widget.number,
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ])),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhoneAuthScreen(),
                          ));
                    },
                    child: Icon(Icons.edit)),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _text1,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      if (value.length == 1) {
                        node.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _text2,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      if (value.length == 1) {
                        node.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _text3,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      if (value.length == 1) {
                        node.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _text4,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      if (value.length == 1) {
                        node.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _text5,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      if (value.length == 1) {
                        node.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _text6,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      if (value.length == 1) {
                        if (_text2.text.length == 1) {
                          if (_text3.text.length == 1) {
                            if (_text4.text.length == 1) {
                              if (_text5.text.length == 1) {
                                String _otp =
                                    '${_text1.text}${_text2.text}${_text3.text}${_text4.text}${_text5.text}';
                                setState(() {
                                  _loading = true;
                                });
                                PhoneCredential(context,
                                    '${_text1.text}${_text2.text}${_text3.text}${_text4.text}${_text5.text}${_text6.text}');
                              }
                            }
                          }
                        }
                      } else {
                        setState(() {
                          _loading = false;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                if (_loading)
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 50,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
