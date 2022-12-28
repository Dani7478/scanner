// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/View/login.dart';
import 'package:flutter_application_1/View/snackbar.dart';

import '../Controller/db_helper.dart';
import '../Model/user_model.dart';
import 'home_data.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameCtrl = TextEditingController();
    TextEditingController passwordCtrl = TextEditingController();
    TextEditingController confirmPasswordCtrl = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: userNameCtrl,
              decoration: InputDecoration(
                hintText: 'Username'.toUpperCase(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  "Enter UserName";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordCtrl,
              decoration: InputDecoration(
                hintText: 'password'.toUpperCase(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  "Enter Password";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: confirmPasswordCtrl,
              decoration: InputDecoration(
                hintText: 'confirm password'.toUpperCase(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  "Enter Password";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
              onPressed: () async {
                DBHelper database = DBHelper.instance;
                User user = new User();
                user.userName = userNameCtrl.text;
                user.passwrord = passwordCtrl.text;
                // ignore: unrelated_type_equality_checks
                if (passwordCtrl.text == confirmPasswordCtrl.text) {
                  int? id = await database.insertUser(user);
                  if (id != null) {
                    // ignore: use_build_context_synchronously
                    showAlert('Congratulation','Registerd Successfully please login Now');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Login()));
                  }
                }
              },
              label: const SizedBox(
                width: 120,
                child: Center(
                  child: Text('Register'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
