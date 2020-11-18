import 'package:ChatterBox/controller/firebasecontroller.dart';
import 'package:ChatterBox/helper/helperfunctions.dart';
import 'package:ChatterBox/screens/views/mydialog.dart';
import 'package:flutter/material.dart';

import '../controller/firebasecontroller.dart';
import '../controller/firebasecontroller.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signInScreen/signUpScreen';

  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUpScreen> {
  _Controller con;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an Account'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Text(
                'Create an account',
                style: TextStyle(fontSize: 25.0),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Username',
                ),
                autocorrect: false,
                validator: con.validatorUsername,
                onSaved: con.onSavedUsername,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: con.validatorEmail,
                onSaved: con.onSavedEmail,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                autocorrect: false,
                obscureText: true,
                validator: con.validatorPassword,
                onSaved: con.onSavedPassword,
              ),
              RaisedButton(
                child: Text(
                  'Create',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                color: Color.fromRGBO(143, 148, 251, 1),
                onPressed: con.signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Controller {
  _SignUpState _state;
  _Controller(this._state);
  String username;
  String email;
  String password;
  FirebaseController fbcon = new FirebaseController();
  HelperFunctions helperFunctions = new HelperFunctions();

  void signUp() async {
    if (!_state.formKey.currentState.validate()) return;

    _state.formKey.currentState.save();

    try {
      await FirebaseController.signUp(email, password);

      Map<String, String> userInfoMap = {
        "email": email,
        "username": username,
      };
      fbcon.uploadUserInfo(userInfoMap);

      HelperFunctions.saveUserEmailSharedPreference(email);
      HelperFunctions.saveUserNameSharedPreference(username);

      HelperFunctions.saveUserLoggedInSharedPreference(true);

      MyDialog.info(
        context: _state.context,
        title: 'Success',
        content: 'Account is created , Sign in',
      );
    } catch (e) {
      MyDialog.info(
        context: _state.context,
        title: 'Error',
        content: e.message ?? e.toString(),
      );
    }
  }

  String validatorUsername(String value) {
    if (value.length < 6)
      return 'minimum 6 chars';
    else
      return null;
  }

  void onSavedUsername(String value) {
    this.username = value;
  }

  String validatorEmail(String value) {
    if (value.contains('@') && value.contains('.'))
      return null;
    else
      return 'not valid email';
  }

  void onSavedEmail(String value) {
    this.email = value;
  }

  String validatorPassword(String value) {
    if (value.length < 6)
      return ' password min 6 char';
    else
      return null;
  }

  void onSavedPassword(String value) {
    this.password = value;
  }
}
