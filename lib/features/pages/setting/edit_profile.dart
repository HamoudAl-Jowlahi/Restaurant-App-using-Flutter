import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant/core/config/page_routes_name.dart';
import '../../../core/constants.dart';
import '../../../core/settings_provider.dart';
import '../../../core/theme/colors_palette.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  Future<void> updateUser() async {
    final url = Uri.parse('${Constants.urlName}${Constants.editProfileDomain}');
    final response = await http.post(
      url,
      body: {
        // 'User_ID': _idController.text,
        'user_name': _nameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );

    print('Response body: ${response.body}');  // Debugging line

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User details updated successfully')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update user details: ${data['message']}')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${response.statusCode}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return
       SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2,color: ColorsPalette.primaryColor),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1)
                        )
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/example.png')

                      )
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: ColorsPalette.primaryColor
                          ),
                           color: Colors.grey,
                        ),
                        child: const Icon(Icons.edit,color: Colors.white,),
                      )
                  ),
                ],
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
                 controller: _nameController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 2),
                  ),
                  hintText: "name",
                  label: Text('name'),

                ),
                         ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
                 controller: _emailController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 2),
                  ),
                  hintText: "email",
                  label: Text('email'),
                ),
                         ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
                 controller:_passwordController ,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 2),
                  ),
                  hintText: "password",
                  label: Text('password'),
                ),
                         ),
             ),
            ElevatedButton(
              onPressed: (){
                updateUser();
                Navigator.pushNamed(context, PageRoutesName.login);
                },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsPalette.primaryColor,
                enabledMouseCursor: MouseCursor.defer,
                foregroundColor: Colors.white, // change the color of text
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                ),
                elevation: 5,
              ),
              child:  Text("Save",
                style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white)

              ),
            ),
            const SizedBox(height: 15,)
          ],

        ),
      );
  }
}


