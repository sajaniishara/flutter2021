import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter2021/rack_home.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([
    //SystemUiOverlay.top, //This line is used for showing the bottom bar
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(left: 40.0, top: 40.0, right: 40.0, bottom: 40.0),
        child: Center(
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
                  padding: EdgeInsets.only(left: 5.0, top: 20.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        obscureText: true,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ))),
              Padding(padding: EdgeInsets.only(top: 10)),
              Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 100,
                    height: 40,
                    child: TextButton(
                      onPressed: showClicked,
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myListView(BuildContext context) {
    final titles = ['Roshan', 'Nalika', 'Thilakshi', 'Uthpala'];

    final icons = ['assets/images/user.png'];

    return ListView.builder(
      padding: EdgeInsets.only(left: 20),
      shrinkWrap: true,
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Container(
            child: Row(
          children: [
            Icon(
              Icons.account_circle_rounded,
              size: 40,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text("Roshan"),
          ],
        ));

        // ListTile(
        //   horizontalTitleGap: 20,
        //   title: Text(titles[index]),
        //   leading: CircleAvatar(backgroundImage: AssetImage(icons[0])),
        // );
      },
    );
  }

  void showClicked() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RackHome()));
      // Fluttertoast.showToast(
      //     msg: result == null ? "Please select a user" : result,
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1);
    });
  }
}
