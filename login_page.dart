import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/geo.dart';
import 'dart:convert';
import 'Food.dart';

// import 'Food.dart';

class Login_Page extends StatefulWidget {
  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  var username = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.phone_android,
              size: 100,
            ),
            SizedBox(height: 25),
            Text(
              'LOGIN PAGE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Center(
                    child: TextFormField(
                      controller: username,
                      decoration: InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Enter a valid email!';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Center(
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                      keyboardType: TextInputType.visiblePassword,
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid Password!';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodPage()),
                  );
                },
                // Map<String, dynamic> jsonMap = {
                //   "login": username.text,
                //   "password": password.text,
                //};
                //       final response = await http.post(
                //           Uri.parse('https://hrmsprime.com/session/auth/login'),
                //           body: jsonEncode(jsonMap),
                //           headers: {"Content-type": "application/json"});

                //       print(jsonDecode(response.body));
                //       login();
                //     },
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // // Future<void> login() async {
  // //   if (password.text.isNotEmpty && username.text.isNotEmpty) {
  // //     var response =
  // //         await http.post(Uri.parse('https://hrmsprime.com/session/auth/login'),
  // //             body: ({
  // //               "login": username.text,
  // //               "password": password.text,
  // //             }));

  //     );
  //   }
  // }
}
