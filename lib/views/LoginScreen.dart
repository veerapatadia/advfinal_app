import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  String? username;
  String? email;
  String? password;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login Screen",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Log In"),
                        content: Form(
                          key: loginKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                controller: usernameController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter username";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  username = val;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter username",
                                  labelText: "Username",
                                  prefixIcon: Icon(Icons.person_outline),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter email";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  email = val;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter email",
                                  labelText: "Email",
                                  prefixIcon: Icon(Icons.email),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.visiblePassword,
                                controller: passwordController,
                                obscureText: true,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter password";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  password = val;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter Password",
                                  labelText: "Password",
                                  prefixIcon: Icon(Icons.password),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              emailController.clear();
                              passwordController.clear();
                              usernameController.clear();
                              username = null;
                              email = null;
                              password = null;
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancel"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              emailController.clear();
                              passwordController.clear();
                              usernameController.clear();
                              username = null;
                              email = null;
                              password = null;
                            },
                            child: Text("Log In"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Log In"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
