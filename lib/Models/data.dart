import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryGreen = Color(0xFF2ECC71);
  static const Color backgroundGrey = Color(0xFFF5F6FA);
  static const Color textDark = Color(0xFF2D3436);
  static const Color cardGrey = Colors.white;
}

class MockData {
  static const List<Map<String, String>> roles = [
    {
      "title": "EV Owner",
      "subtitle": "Find stations and plan routes",
      "icon": "person_outline"
    },
    {
      "title": "Station Owner",
      "subtitle": "Manage your charging stations",
      "icon": "home_work_outlined"
    },
    {
      "title": "Administrator",
      "subtitle": "Manage system and users",
      "icon": "verified_user_outlined"
    },
  ];
}