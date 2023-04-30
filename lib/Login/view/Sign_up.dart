import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../provider/Login_provider.dart';

class Sign_in extends StatefulWidget {
  const Sign_in({Key? key}) : super(key: key);

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in>
{
  LoginProvider? loginProviderfalse;
  LoginProvider? loginProvidertrue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal.shade200,
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: loginProviderfalse?.txtEmail,
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
                controller: loginProviderfalse?.txtPassword,
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
                  loginProviderfalse?.singup(loginProviderfalse!.txtEmail.text,loginProviderfalse!.txtPassword.text);
                  loginProviderfalse?.txtPassword.clear();
                  loginProviderfalse?.txtEmail.clear();
                },
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text("Sign Up",style: TextStyle(color: Colors.teal,fontSize: 23)),
                    decoration: BoxDecoration(color: Colors.teal.shade200,borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Already have account?",
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text(
                  "Login",
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