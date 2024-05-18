import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login_page.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Welcome$name",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: context.theme.colorScheme.secondary),
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                          labelStyle: TextStyle(
                              color: context.theme.colorScheme
                                  .secondary), // Change label text color
                          hintStyle: TextStyle(
                              color: context.theme.colorScheme
                                  .secondary), // Change hint text color
                        ),
                        style: TextStyle(
                            color: context.theme.colorScheme
                                .secondary), // Change input text color
                        onChanged: (value) {
                          name = ", $value";
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username can't be empty";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password",
                          labelStyle: TextStyle(
                              color: context.theme.colorScheme
                                  .secondary), // Change label text color
                          hintStyle: TextStyle(
                              color: context.theme.colorScheme
                                  .secondary), // Change hint text color
                        ),
                        style: TextStyle(
                            color: context.theme.colorScheme.secondary),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password can't be empty";
                          } else if (value.length < 6) {
                            return "Password must be atleast 6 characters";
                          }

                          return null;
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Material(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: changeButton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text("Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
