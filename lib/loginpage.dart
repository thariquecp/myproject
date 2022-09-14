import 'package:flutter/material.dart';
import 'package:myproject/dashboard.dart';
import 'package:myproject/sample.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://user-images.githubusercontent.com/33026403/95328437-d882aa00-08a5-11eb-9ba2-ea5f3c43cc1d.png",
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _textwithfield(
                context: context,
                text: "Username:",
                masked: false,
                controller: userNameController),
            _textwithfield(
                context: context,
                text: "Password:",
                masked: true,
                controller: passwordController),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                try {
                  await pref.setString("username", userNameController.text);
                  await pref.setString("password", passwordController.text);
                  await pref.setBool("loggedIn", true);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardScreen()));
                } on Exception catch (e) {
                  final snackBar = SnackBar(
                    content: Text("Cannot Login " + e.toString()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.5,
                      MediaQuery.of(context).size.height * 0.05)),
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _textwithfield(
    {required context,
    required String text,
    required bool masked,
    required TextEditingController controller}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              "$text",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          validator: (value) {
            if (value==null || value.isEmpty){
              return 'Please enter something';
            }
            return null;
          },
          controller: controller,
          obscureText: masked,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: Colors.blueAccent),
            ),
          ),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
