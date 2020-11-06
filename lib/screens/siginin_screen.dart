import 'package:CreativeWork2/controller/firebasecontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/signInScreen';

  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignInScreen> {
  var formKey = GlobalKey<FormState>();
  _Controller con;

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                // validator: con.validatorEmail,
                // onSaved: con.onSavedEmail,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
                autocorrect: false,
                // validator: con.validatorPassword,
                // onSaved: con.onSavedPassword,
              ),
              RaisedButton(
                child: Text('Sign In',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    )),
                color: Colors.blue,
                onPressed: con.signIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Controller {
  _SignInState _state;
  _Controller(this._state);

  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signIn() async {
    if (!_state.formKey.currentState.validate()) {
      return;
    }

    _state.formKey.currentState.save();

    User user;
    
    try {
      user = await FirebaseController.signIn(email, password);
      print('USER: $user');
    } catch (e) {
      // MyDialog.circularProgressEnd(_state.context);
      // MyDialog.info(
      //   context: _state.context,
      //   title: 'Sign In Error',
      //   content: e.message ?? e.toString(),
      // );
      return;
    }
    Navigator.pushReplacementNamed(_state.context, HomeScreen.routeName);
  }
}
