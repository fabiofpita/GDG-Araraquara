import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _email;
  String _senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(fontSize: 15),
                  onChanged: (value) {
                    _email = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "E-Mail",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    _senha = value;
                  },
                  style: TextStyle(fontSize: 15),
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Senha",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                height: 60,
                child: RaisedButton(
                  textColor: Colors.white,
                  child: Text(
                    'LOG IN',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    try {
                      var user = await _handleLogin();
                      print(user);
                      // final snackBar = SnackBar(
                      //   content:
                      //       Text('Usuário ' + user.displayName + ' logado!'),
                      // );

                      // Scaffold.of(context).showSnackBar(snackBar);
                    } catch (error) {
                      print(error);
                      //final snackBar = SnackBar(
                      //   content:
                      //       Text('Usuário ' + user.displayName + ' logado!'),
                      // );

                      // S
                    }
                  },
                  color: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.transparent)),
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
      email: this._email,
      password: this._senha,
    );

    return result.user;
  }
}
