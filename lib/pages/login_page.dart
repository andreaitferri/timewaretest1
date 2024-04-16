import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timewaretest1/services/network/auth_service.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Effettua il login"),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              authService.login(passwordController.text, context);
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
