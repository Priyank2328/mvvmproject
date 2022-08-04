import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _obscureText = true;

  String _password;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: new Column(
          children: <Widget>[
            new TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Password',
                  icon: const Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: const Icon(Icons.lock))),
              validator: (val) => val.length < 6 ? 'Password too short.' : null,
              onSaved: (val) => _password = val,
              obscureText: _obscureText,
            ),
            new FlatButton(
                onPressed: _toggle,
                child: new Text(_obscureText ? "Show" : "Hide"))
          ],
        ),
      ),
    );
  }
}
