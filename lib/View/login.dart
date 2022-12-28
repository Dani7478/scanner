import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/register.dart';
import 'package:flutter_application_1/View/showallData.dart';
import 'package:flutter_application_1/View/snackbar.dart';

import '../Controller/db_helper.dart';
import 'home_data.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameCtrl=TextEditingController();
    TextEditingController passwordCtrl=TextEditingController();
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
            FloatingActionButton.extended(
              onPressed: () async{
                DBHelper database = DBHelper.instance;
           var result=await database.checkUser(userNameCtrl.text, passwordCtrl.text);
           print(result);
            if(result){
              showAlert('Welcome','Welcome in Scanner App');
              Navigator.push(context, MaterialPageRoute(builder: (_) => ShowList()));
            }else {
              showAlert('Oh No','SomethingWent Wrong');
            }
              },
              label: const SizedBox(
                width: 120,
                child: Center(
                  child: Text('Login'),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Dont have an account?'),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const Register()));
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
