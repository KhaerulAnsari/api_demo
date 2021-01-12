import 'package:api_demo/post_result_model.dart';
import 'package:api_demo/user_model.dart';
import 'package:api_demo/user_model_dua.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;
  User user = null;
  String output = "no data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Api Demo")),
        body: Stack(
          children: <Widget>[
            Center(
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 30),
                        child: Card(
                          elevation: 10,
                          child: Container(
                            width: 300,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text((postResult != null)
                                    ? postResult.id +
                                        " | " +
                                        postResult.name +
                                        " | " +
                                        postResult.job +
                                        " | " +
                                        postResult.created
                                    : "Tidak ada data"),
                                RaisedButton(
                                    child: Text("POST"),
                                    onPressed: () {
                                      PostResult.connectToApi("badu", "dokter")
                                          .then((value) {
                                        postResult = value;
                                        setState(() {});
                                      });
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Card(
                          elevation: 10,
                          child: Container(
                            width: 300,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text((user != null)
                                    ? user.id + " | " + user.name
                                    : "Tidak ada data"),
                                RaisedButton(
                                  child: Text("GET"),
                                  onPressed: () {
                                    User.connectToAPi("3").then((value) {
                                      user = value;
                                      setState(() {});
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Card(
                          elevation: 10,
                          child: Container(
                            width: 300,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(output),
                                RaisedButton(
                                    child: Text("GET LIST"),
                                    onPressed: () {
                                      Users.getUsers("1").then((userss) {
                                        output = "";
                                        for (int i = 0; i < userss.length; i++)
                                          output = output +
                                              "[" +
                                              userss[i].name +
                                              "]";
                                        setState(() {});
                                      });
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
