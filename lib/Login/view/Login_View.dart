import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginProvider? loginProviderfalse;
  LoginProvider? loginProvidertrue;
  @override
  Widget build(BuildContext context) {
    loginProviderfalse = Provider.of<LoginProvider>(context,listen: false);
    loginProvidertrue = Provider.of<LoginProvider>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal.shade200,
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: loginProviderfalse!.txtEmail,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.teal)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.teal)),
                    label: Text(
                      "Email",
                      style: TextStyle(color: Colors.teal),
                    )),
                // controller:
              ),
              SizedBox(height: 9,),
              TextField(
                controller: loginProviderfalse!.txtPassword,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.teal)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.teal)),
                    label: Text(
                      "Password",
                      style: TextStyle(color: Colors.teal),
                    )),
                // controller:
              ),
              SizedBox(height: 9,),
              InkWell(
                onTap: () {
                  loginProviderfalse!.read();
                  if(loginProviderfalse!.Email==loginProviderfalse!.txtEmail&&loginProviderfalse!.Password==loginProviderfalse!.txtPassword)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Email & password")));
                  }
                  else
                  {
                    Navigator.pushReplacementNamed(context, 'Login');
                  }
                },
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'Login');
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text("Login",style: TextStyle(color: Colors.teal,fontSize: 23)),
                    decoration: BoxDecoration(color: Colors.teal.shade200,borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Don't have account?",
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'Sign');
                },
                child: Text(
                  " Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.teal,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}