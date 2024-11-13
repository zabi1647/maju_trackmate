import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/screens/auth/first_auth_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget getLogoutButton() {
  return PopupMenuButton(
    icon: const Icon(
      Icons.more_vert,
      color: Colors.white,
      size: 35,
    ),
    itemBuilder: (context) => [
      const PopupMenuItem(
        value: 'signout',
        child: Row(
          children: [
            Icon(Icons.logout, color: Colors.red),
            SizedBox(width: 10),
            Text('Sign Out'),
          ],
        ),
      ),
    ],
    onSelected: (value) async {
      if (value == 'signout') {
        // Handle sign out logic here

        final prefs = await SharedPreferences.getInstance();

        prefs.clear();

        Get.offAll(() => const FirstAuthScreen());
      }
    },
  );
}
