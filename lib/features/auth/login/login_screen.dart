import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../core/config/page_routes_name.dart';
import '../../../core/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obSecured = true;

  Future<void> login() async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.urlName}${Constants.loginDomain}'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'user_name': _usernameController.text,
          'password': _passwordController.text,
        },
      ).timeout(const Duration(seconds: 10));

      print('Raw response: ${response.body}'); // 🔍 Debug raw output

      // ✅ Trim response to remove extra spaces or newlines
      final jsonString = response.body.trim();

      // ✅ Handle non-JSON cases
      if (!jsonString.startsWith("{")) {
        print("❌ Server did not return valid JSON");
        return;
      }

      final data = jsonDecode(jsonString);

      if (data['status'] == 'success') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', _usernameController.text);
        prefs.setInt('user_id', int.tryParse(data['user_id'].toString()) ?? 0);
        prefs.setString('email', data['email'] ?? "A");

        print("✅ User ID saved: ${data['user_id']}");
        print("✅ Email saved: ${data['email']}");

        Navigator.pushNamed(context, PageRoutesName.layout);
      } else {
        print('❌ Login failed: ${data['message']}');
      }
    } catch (e) {
      print('❌ Error: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow.shade100, Colors.pink.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text('Enter your credentials to login'),
                  const SizedBox(height: 16),
                   TextField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    controller: _usernameController,
                  ),
                  const SizedBox(height: 16),
                    TextField(

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
                  ),
                    ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed:login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PageRoutesName.resetPassword);
                    },
                    child: const Text('Forgot password?'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PageRoutesName.layout);
                    },
                    child: const Text('Sign in anyway'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PageRoutesName.register);
                    },
                    child: const Text("Don't have an account? Sign Up"),
                  ),
                  const SizedBox(height: 40,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


