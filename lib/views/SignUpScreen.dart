import 'package:advfinalapp/model/sqlitedb.dart';
import 'package:advfinalapp/model/usermodel.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  final GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  String? email;
  int? id;
  String? password;
  String? username;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign Up Screen",
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
                        title: Text("Sign up"),
                        content: Form(
                          key: signupKey,
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
                                  hintText: "Enter Username",
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
                            onPressed: () async {
                              if (signupKey.currentState!.validate()) {
                                signupKey.currentState!.save();

                                // Map result = await DBHelper.dbHelper.insertUser(
                                //   user: Users(
                                //     password: password!,
                                //     email: email!,
                                //     username: username!,
                                //     id: id!,
                                //   ),
                                // );
                              }
                              emailController.clear();
                              passwordController.clear();
                              usernameController.clear();
                              username = null;
                              email = null;
                              password = null;
                            },
                            child: Text("Sign Up"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Sign Up"),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have account?  "),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('login_screen');
                },
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
