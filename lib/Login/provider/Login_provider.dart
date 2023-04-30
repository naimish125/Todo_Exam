import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  String? Password;
  String? Email;
  Future<void> singup(String email,String pass) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('e1', email);
    await prefs.setString('p1', pass);
  }

  Future<void> read() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Email = prefs.getString('e1');
    Password = prefs.getString('p1');
    notifyListeners();
  }
}

