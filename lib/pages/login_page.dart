import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Image.asset(
          "assets/images/login_page.png",
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 16.0),
        const Text(
          "Welcome",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Enter Username", labelText: "Username"),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "Enter Password", labelText: "Password"),
              )
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          child: Text("Login"),
          style: TextButton.styleFrom(),
          onPressed: () {
            print("Hello World!");
          },
        )
      ],
    ));
  }
}
