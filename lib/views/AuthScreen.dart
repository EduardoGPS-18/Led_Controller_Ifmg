import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _nameController = TextEditingController(), _passwordController = TextEditingController();

  final String _registeredName = "Eduardo", _registeredPassword = "12345";

  String _msg = "Entre com seus dados";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.amber[400],
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Text(
                "Controle de Led's",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 32,
                ),
              ),
            ),
            SizedBox(height: 58),
            authFormFieldWidget(
              ctrl: _nameController,
              hintLabel: "Digite seu nome!",
              labelText: "Nome",
            ),
            SizedBox(height: 5),
            authFormFieldWidget(
              ctrl: _passwordController,
              hintLabel: "Digite sua senha!",
              labelText: "Password",
              password: true,
            ),
            ElevatedButton(
              onPressed: () => gotoHomePage(context),
              child: Text(
                "Entrar",
                style: TextStyle(color: Colors.grey[800]),
              ),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber[500])),
            ),
            Text(
              _msg,
              style: TextStyle(color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }

  void gotoHomePage(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());

    if (_nameController.text != _registeredName || _passwordController.text != _registeredPassword) {
      setState(() {
        _msg = "Acesso negado!";
      });
      return;
    }

    Navigator.pushReplacementNamed(context, "/home");
  }

  Widget authFormFieldWidget({TextEditingController ctrl, String hintLabel, bool password = false, String labelText}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[600],
      ),
      child: TextFormField(
        controller: ctrl,
        style: TextStyle(color: Colors.white),
        keyboardType: TextInputType.name,
        cursorColor: Colors.white,
        obscureText: password,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.white),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          border: InputBorder.none,
          hintText: hintLabel,
        ),
      ),
    );
  }
}
