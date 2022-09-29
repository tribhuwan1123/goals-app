import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:fitness/model/login/user_model.dart';
import 'package:fitness/screens/dashboard/dashboard_screen.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fitness/services/LoginService.dart';
import 'package:provider/provider.dart';
import '../onboarding/onboarding_screen.dart';
import '/animation/Slide.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  String _email = "", _password = "";
  bool _obscureText = true;
  bool registering = false;
  String deviceId = "";
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final usernameEditController = TextEditingController();
  final passwordEditController = TextEditingController();

  final Map<String, String> _authData = {};
  bool isLoading = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  image: DecorationImage(
                    image: const AssetImage("assets/images/two.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2),
                      BlendMode.dstATop,
                    ),
                  )),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          child: Container(
                            margin: const EdgeInsets.only(top: 100),
                            child: const Center(
                              child: Text(
                                "Make Yourself Fit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          _formInputFields(),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () => {},
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forgot Password?  ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          isLoading
                              ? const CircularProgressIndicator()
                              : InkWell(
                                  onTap: () => {_proceed()},
                                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileUi()));
                                  child: Hero(
                                    tag: "submit-button",
                                    child: Container(
                                      height: 55,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            /* Color(0xFF3383CD),
                                        Color(0xFF11249F) */
                                            Colors.black,
                                            Colors.black
                                          ],
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            height: 80,
                          ),
                          InkWell(
                            onTap: () => {},
                            child: const Text(
                              "Create New Account",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _formInputFields() {
    return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(143, 148, 251, .2),
                  blurRadius: 20.0,
                  offset: Offset(0, 10))
            ]),
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      controller: usernameEditController,
                      validator: (value) {
                        if (value!.isEmpty) return "Email is required.";
                        return EmailValidator.validate(value.trim())
                            ? null
                            : "Please enter a valid email";
                      },
                      onSaved: (value) {
                        _authData['email'] = value!.trim();
                        _email = value.trim();
                      },
                      onChanged: (value) {
                        _authData['email'] = value.trim();
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          errorStyle: TextStyle(color: Colors.white),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      controller: passwordEditController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required.";
                        }
                        return null;
                      },
                      obscureText: _obscureText,
                      // obscuringCharacter: '*',
                      onFieldSubmitted: (_) => {},
                      onSaved: (value) {
                        _authData['password'] = value!;
                        _password = value;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(Icons.lock_outline,
                              color: Colors.white),
                          suffixIcon: InkWell(
                              child: _obscureText
                                  ? const Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                    )
                                  : const Icon(
                                      Icons.lock_open,
                                      color: Colors.white,
                                    ),
                              onTap: () => _toggle())),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  _proceed() async {
    if (_formKey.currentState == null) {
      return;
    }
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    try {
      _loggingIn(true);
      await Provider.of<LoginService>(context, listen: false)
          .login(UserModel(_email, _password));
      _loggingIn(false);
      Flushbar(
        title: "Success",
        message: "Welcome. . .",
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
      )..show(context).then((value) => Navigator.push(context,
          Slide(builder: (context) => const Dashboard(), settings: null)));
      _loggingIn(false);
    } catch (e) {
      _loggingIn(false);
      Flushbar(
        title: "Error",
        message: e.toString(),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ).show(context);
      print(e.toString());
    }
  }
}

void _loggingIn(bool loggingIn) {}
