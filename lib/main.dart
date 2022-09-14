import 'package:flutter/material.dart';
import 'package:myproject/dashboard.dart';
import 'package:myproject/loginpage.dart';
import 'package:myproject/sample.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.


  Future<bool> checkUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("loggedIn") != null &&
        prefs.getBool("loggedIn") == true) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: checkUserLogin(),
        builder: (context, AsyncSnapshot<bool> snapshot){
          if(snapshot.hasData){
            return snapshot.data! == true  ? DashboardScreen() : LoginPage();
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return Container(color: Colors.white,);
          }else{
            return Text("error");
          }
        },
      )
    );
  }
}
