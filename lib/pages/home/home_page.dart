import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdg/pages/login/login_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.clamp,
            colors: [Colors.pink[500], Colors.red[800], Colors.deepOrange[900]],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/icon.png",
                alignment: Alignment.topCenter,
                width: 100,
                height: 80,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'GDG Tinder',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 80),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  alignment: Alignment.center,
                  child: Text(
                    'By tapping in Log In, you agree with our Terms of service and Privacy Policy',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                height: 45,
                child: RaisedButton(
                  textColor: Colors.white,
                  child: Text(
                    'LOG IN WITH FACEBOOK',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    // LocationData currentLocation;
                    // var location = new Location();

                    // try {
                    //   currentLocation = await location.getLocation();
                    //   print(currentLocation.latitude);
                    //   print(currentLocation.longitude);
                    // } on Exception catch (e) {
                    //   print(e);
                    //   currentLocation = null;
                    // }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  color: Color.fromRGBO(59, 89, 152, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.transparent)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: double.infinity,
                height: 45,
                child: OutlineButton(
                  child: Text(
                    'LOG IN WITH PHONE NUMBER',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textColor: Colors.white,
                  shape: StadiumBorder(),
                  borderSide: BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                  ),
                  onPressed: () {
                    _handleLogin();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<FirebaseUser> _handleLogin() async {
    final AuthResult result = await _auth.signInWithEmailAndPassword(
      email: 'fabiopita@mail.com',
      password: 'ronaldo',
    );

    return result.user;
  }
}
