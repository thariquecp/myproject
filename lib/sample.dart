import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ModelFile.dart';
import 'loginpage.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  bool isLoading = false;
  List<ModelFIle> modelList = [];


  @override

  void initState() {

    getDetails();

    setState(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.clear();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[ Container(


                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      color: Colors.red,
                      child: Text('Logout'),
                    ),
                    ]
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: modelList.length,
                itemBuilder: (BuildContext context, int position) {
                  return Column(
                    children: [
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap:  true,
                          itemCount: modelList[position].organisations?.length,
                          itemBuilder:(BuildContext context, int index){
                            return Padding(
                              padding: const EdgeInsets.only(left: 8,right: 8),
                              child: Card(
                                elevation: 5,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.network(modelList[position].organisations![index].avatarUrl!,
                                        width: 100,
                                        height: 100,),
                                    ),
                                    Text(modelList[index].nickname.toString(),
                                      style: (
                                          TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.red
                                          )
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(modelList[position].pullRequests![index].body.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        DateFormat("yyyy MMM dd hh:mm").
                                        format(DateTime.parse(
                                            modelList[position].pullRequests![index].createdAt!.split(' ')[0])).toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),),
                                    )

                                  ],

                                ),
                              ),
                            );

                          }),
                    ],
                  );
                },
              ),
            ],
          ),
        ),

      ),
    );
  }
  Future<void> getDetails() async {
    isLoading = true;
    setState(() {});
    var response;
    String url = "https://24pullrequests.com/users.json?page=1";
    response = await http.get(Uri.parse(url));
    isLoading = false;

    if (response.statusCode == 200) {
      String responseString = response.body;
      var data = jsonDecode(responseString);

      modelList =
      List<ModelFIle>.from(data.map((x) => ModelFIle.fromJson(x)));

      setState(() {});
    }
  }
}
