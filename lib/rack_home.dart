import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter2021/BaseStatelessClass.dart';

class RackHome extends BaseStateless {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: super.appBar(context) as PreferredSizeWidget,
      body: Container(
          padding: EdgeInsets.all(10),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                child: Column(
                  children: [
                    Text("Scan QR"),
                    Icon(
                      Icons.qr_code_scanner,
                      size: 200,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    IconButton(
                        iconSize: 50,
                        // color: Colors.green,
                        onPressed: () {},
                        icon: Icon(
                          Icons.switch_camera,
                          // size: 50,
                        )),
                    Text("Switch Camera")
                  ],
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.topLeft,
                child: Text("In progress status"),
              ),
              Row(
                children: [
                  Chip(
                    backgroundColor: Colors.red,
                    //labelPadding: EdgeInsets.only(left: 20, right: 20),
                    label: SizedBox(
                      width: 30,
                      child: Center(child: Text('180')),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Chip(
                    backgroundColor: Colors.purple,
                    //labelPadding: EdgeInsets.only(left: 20, right: 20),
                    label: SizedBox(
                      width: 30,
                      child: Center(child: Text('12')),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Chip(
                    backgroundColor: Colors.green,
                    //labelPadding: EdgeInsets.only(left: 20, right: 20),
                    label: SizedBox(
                      width: 30,
                      child: Center(child: Text('4')),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
