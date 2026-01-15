import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../core/config/page_routes_name.dart';
import '../../../core/constants.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool obSecured = true;

  Future<void> registerUser() async {
    final response = await http.post(
      Uri.parse('${Constants.urlName}${Constants.registrationDomain}'),
      body: {
        'user_name': _usernameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );

    try {
      var data = json.decode(response.body);
      print(data);
      if (data['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'])),
        );
        Navigator.pushNamed(context, PageRoutesName.login);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'])),
        );
      }
    } catch (e) {
      print('Error: $e');
      print('Response body: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow.shade100, Colors.red.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Register Now!',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text('Create your account'),
                    const SizedBox(height: 16),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "plz Enter the name";
                        }
                        var regex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&*()*+]");
                        if (!regex.hasMatch(value)) {
                          return "No valid user name";
                        } else {
                          return null;
                        }
                      },
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "plz Enter the email";
                        }
                        var regex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&*()*+]+@[a-zA-Z0-9.a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (!regex.hasMatch(value)) {
                          return "example: user@example.com";
                        } else {
                          return null;
                        }
                      },

                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "plz Enter the password";
                        }
                      },
                      controller: _passwordController,
                      obscureText: obSecured,
                      decoration:  InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          border: const OutlineInputBorder(),

                          suffixIcon: InkWell(

                            child: Icon(
                                color: Colors.black,
                                obSecured
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                            onTap: () {
                              setState(() {
                                obSecured = !obSecured;
                              });
                            },
                          ),
                          // focusedErrorBorder:,

                      ),
                      // decoration: const InputDecoration(
                      //   labelText: 'Password',
                      //   prefixIcon: Icon(Icons.lock),
                      //   border: OutlineInputBorder(),
                      //   suffixIcon: InkWell(
                      //
                      //     child: Icon(
                      //         color: Colors.white,
                      //         obSecured
                      //             ? Icons.visibility_off
                      //             : Icons.visibility),
                      //     onTap: () {
                      //       setState(() {
                      //         obSecured = !obSecured;
                      //       });
                      //     },
                      //   ),
                      // ),

                    ),
                    const SizedBox(height: 16),
                    TextFormField(

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please confirm your password";
                      }
                      if (value != _passwordController.text)
                      { return "Passwords do not match";
                      } return null;},
                      // controller: _passwordController,
                      obscureText: obSecured,
                      decoration: InputDecoration(
                        labelText: 'confirm Password',
                        prefixIcon: const Icon(Icons.lock),
                        border: const OutlineInputBorder(),
                        suffixIcon: InkWell(

                          child: Icon(
                              color: Colors.black,
                              obSecured
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                          onTap: () {
                            setState(() {
                              obSecured = !obSecured;
                            });
                          },
                        ),

                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed:(){// Disable user interaction

                        if (formKey.currentState!.validate()) {
                          registerUser();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: const Text('Sign up'),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, PageRoutesName.login);
                      },
                      child: const Text("Already have an account? Login"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, PageRoutesName.layout);
                      },
                      child: const Text("Login anyway"),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
