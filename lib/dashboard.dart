// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:myproject/loginpage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class DashBoard extends StatelessWidget {
//   const DashBoard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: NetworkImage(
//               "https://user-images.githubusercontent.com/33026403/95328437-d882aa00-08a5-11eb-9ba2-ea5f3c43cc1d.png",
//             ),
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//
//               padding: EdgeInsets.only(top: 50),
//               child: Text("Dashboard",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//                 ),
//             ),
//
//             SizedBox(
//               height: 600,
//
//             ),
//             GestureDetector(
//               onTap: () async{
//                 SharedPreferences prefs = await SharedPreferences.getInstance();
//                 await prefs.clear();
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:[ Container(
//
//
//                   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                   color: Colors.blue,
//                   child: Text('Logout'),
//                 ),
//                 ]
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }
