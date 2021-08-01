import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(left: 40.0, top: 40.0, right: 40.0, bottom: 40.0),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: 0, top: 40.0, right: 0.0, bottom: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select your Profile',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              _myListView(context),
              Padding(
                  padding: EdgeInsets.only(left: 5.0, top: 40.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text.rich(TextSpan(
                          text: 'Password ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                          children: <InlineSpan>[
                            TextSpan(
                              text: '*',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          ])))),
              Padding(
                  padding: EdgeInsets.only(left: 5.0, top: 40.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        obscureText: true,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ))),
              Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: showClicked,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                  )),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _myListView(BuildContext context) {
    final titles = ['Roshan', 'Nalika', 'Thilakshi', 'Uthpala'];

    final icons = ['assets/images/user.png'];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Center(
            child: ListTile(
          title: Text(
            titles[index],
            textAlign: TextAlign.center,
          ),
          onTap: () {
            result = titles[index];
          },
          selectedTileColor: Colors.blue,
          leading: Container(
              width: 150,
              height: 30,
              alignment: Alignment.centerRight,
              child: CircleAvatar(backgroundImage: AssetImage(icons[0]))),
        ) // leading: Align(alignment: Alignment.center,child:CircleAvatar(backgroundImage: AssetImage(icons[0])))),
            );
      },
    );
  }

  void showClicked() {
    setState(() {
      Fluttertoast.showToast(
          msg: result==null?"Please select a user":result,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
    });
  }
}
