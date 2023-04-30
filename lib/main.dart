import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoexam/Login/provider/Login_provider.dart';

import 'Login/view/Login_View.dart';
import 'Login/view/Sign_up.dart';
import 'ToDo/provider/Todo_Provider.dart';
import 'ToDo/view/Todo_View.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoProvider(),
        ),
        ChangeNotifierProvider(
        create: (context) => LoginProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => LoginScreen(),
          'Login': (context) => TodoScreen(),
           'Sign' : (context) => Sign_in(),
        },
      ),
    ),
  );
}