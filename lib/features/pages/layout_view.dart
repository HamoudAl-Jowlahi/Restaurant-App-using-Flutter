import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/config/page_routes_name.dart';
import 'package:restaurant/core/theme/colors_palette.dart';
import 'package:restaurant/features/pages/favorite/favorite_page.dart';
import 'package:restaurant/features/pages/home/home_view.dart';
import 'package:restaurant/features/pages/setting/setting_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../core/config/app_router.dart';
import '../../core/constants.dart';
import '../../core/share_app.dart';
import '../../core/theme/app_theme_manager.dart';


class LayOutView extends StatefulWidget {
  const LayOutView({super.key});

  @override
  State<LayOutView> createState() => _LayOutViewState();
}

class _LayOutViewState extends State<LayOutView> {
  String username = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  /// Load the saved username from SharedPreferences
  // void _loadUsername() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   // String savedUsername = prefs.getString('username') ?? 'Guest';
  //   // String savedEmail = prefs.getString('email') ?? 'user@resto.com';
  //   // print('Saved Username: $savedUsername');
  //   // print('Saved Email: $savedEmail');
  //
  //   setState(() {
  //     username = prefs.getString('username') ?? 'Guest'; // Default to 'Guest' if no username is found
  //     email = prefs.getString('email') ?? 'user@resto.com';
  //     // String? email = prefs.getString('email') ?? 'No Email'; // ✅ Add this
  //     print("✅ Retrieved Email: $email"); // ✅ Debugging
  //   });
  // }
  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve and print user_id for debugging
    int? userId = prefs.getInt('user_id');
    print("🔍 Retrieved User ID: $userId");

    setState(() {
      username = prefs.getString('username') ?? 'Guest';
      email = prefs.getString('email') ?? 'user@resto.com';
      print("✅ Retrieved Email: $email");
    });
  }
  int currentIndex = 0;

  List<Widget> screens = [
    const HomePageView(),
    FavoriteScreen(),
    const SettingView(),
  ];
// logout function
  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('user_id');

    if (userId == null || userId == 0) {
      print("❌ Cannot log out: No valid user ID found.");
      return;
    }

    print("🔄 Logging out user ID: $userId");

    final response = await http.post(
      Uri.parse('${Constants.urlName}/restaurant/logout.php'),
      body: {'user_id': userId.toString()},
    );

    print("🔄 Response: ${response.body}");

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      if (responseData['status'] == 'success') {
        print("✅ User deleted from database");

        // Clear SharedPreferences
        await prefs.clear();

        // Navigate to login screen
        Navigator.pushReplacementNamed(context, PageRoutesName.login);
      } else {
        print("❌ Failed to delete user: ${responseData['message']}");
      }
    } else {
      print("❌ Server error");
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $username'),
      ),
      drawer:_buildDrawer(),// ✅ Added Drawer
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: ColorsPalette.primaryColor,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: "Home", icon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(
              label: "Favorite", icon: Icon(Icons.favorite_border)),
          BottomNavigationBarItem(
              label: "Profile", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
 Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(username, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // accountEmail: Text('$username@gmail.com'),
            accountEmail: Text(email),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: ColorsPalette.primaryColor),
            ),
          ),
          // ListTile(
          //   leading: const Icon(Icons.share),
          //   title: const Text("Share app"),
          //   onTap: () {
          //     ShareUtil.shareAppLink();
          //     Navigator.pop(context);
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.square_rounded),
            title: const Text("Theme"),
            onTap: () {
              setState(() {
                currentIndex = 1;
              });
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              leading: const Icon(Icons.light_mode,size: 22,),
              title: const Text("Light",style: TextStyle(fontSize: 16),),
              onTap: () {
                setState(() {
                  // currentIndex = 1;
                  Get.changeTheme(AppThemeManager.lightTheme);
                });
                // Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              leading: const Icon(Icons.dark_mode_outlined,size: 22,),
              title: const Text("dark",style: TextStyle(fontSize: 16)),
              onTap: () {
                setState(() {
                  Get.changeTheme(AppThemeManager.darkTheme);
                });
                // Navigator.pop(context);
              },
            ),
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () async {

                  // SharedPreferences prefs = await SharedPreferences.getInstance();
                  // int userId = prefs.getInt('user_id') ?? 0; // Retrieve user_id from SharedPreferences
                  // await logout(userId);
                  await logout(context);// Call the logout function with the user ID


                  // Navigator.pop(context);

              // SharedPreferences prefs = await SharedPreferences.getInstance();
              // await prefs.remove('username'); // Clear saved username
              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
 }
  /// ✅ Drawer Widget

  }





