/// Main coder: Uyen
/// Small modification: Chi

import 'package:Fulbright_Vietnam_Forum/services/firebase_auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  // String _email = ''; // to store user input
  // String _password = '';
  bool login = false;
  bool isPasswordCorrect = true;
  bool isPasswordHidden = true; // password is hidden at first
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void loginUser() {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
          email: _emailController.text,
          password: _passwordController.text,
          context: context,
        );
  }
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 25, 110, 1),
        body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.8,
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                      width: 1, color: Color.fromARGB(255, 255, 255, 255))),
              ////////// content inside box
              child: Column(children: [
                Image.asset('images/icon/Logo.png'),
                SizedBox(height: 30),
                Text('Welcome to Fulbright Community Forum'),
                SizedBox(height: 30),
                ////////// textfields
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  // ======================USERNAME INPUT================
                  Text('Username',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 25, 110, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w400)),
                  SizedBox(height: 10),

                  //====== username textfield ======
                  TextFormField(
                      style: TextStyle(fontSize: 16.0),
                      controller: _emailController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(0, 25, 110, 100))),
                          hintText: 'Enter your username',
                          // errorText: 'Incorrect username or password',
                          suffixIcon: Icon(Icons.perm_identity_rounded),
                          fillColor: Colors.grey[200],
                          filled: true),
                                                  
                          ),
                  SizedBox(height: 20),

                  // PASSWORD INPUT
                  Text('Password',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 25, 110, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w400)),
                  SizedBox(height: 10),

                  //====== password textfield ====== 
                  TextFormField(
                    key: ValueKey('password'),
                    style: TextStyle(fontSize: 16.0),
                    obscureText: isPasswordHidden,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(0, 25, 110, 100))),
                        // errorText: isPasswordCorrect
                        //     ? null
                        //     : 'Incorrect login information',
                        errorStyle: TextStyle(color: Colors.red),
                        // eye_icon
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordHidden = !isPasswordHidden;
                              });
                            },
                            child: Icon(isPasswordHidden
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                        fillColor: Colors.grey[150],
                        filled: true)),
                  SizedBox(height: 10),
                  Text('Forgot Password',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w100)),
                  TextButton(
                    onPressed: () => print('FP is pressed'),
                    child: Text(''),
                  ),
                  SizedBox(height: 10),

                  // ============ Login elevated button ============ 
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                        child: Text('Login',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 25, 110, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w100)),
                            
                            onPressed: loginUser,
                        // onPressed: () async {
                        //   if (_formKey.currentState!.validate()) {
                            
                        //   }
                        //   // update our string variable to get user input
                        //   // Chi works on the verification for the _email
                        //   _email = _emailController.text;
                        //   if (_email == "mail" && _password == '1234') {
                        //     isPasswordCorrect = true;
                        //     GoRouter.of(context).pushNamed("home");
                        //     // password is correct, do something);
                        //   } else {
                        //     setState(() {
                        //       isPasswordCorrect = false;
                        //     });
                        //   }
                        // },
                        
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(20.0),
                            fixedSize: Size(110, 49),
                            primary: Color.fromRGBO(255, 173, 29, 1))),
                  )
                ])
              ])),
        ));
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  
}
