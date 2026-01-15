import 'package:flutter/material.dart';
import 'package:restaurant/features/pages/setting/edit_profile.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('Edit Profile'),
          EditProfile(),
        ],
      ),
    );
  }
}
