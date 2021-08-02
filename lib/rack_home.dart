import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupItem {
  int value;
  String name;
  PopupItem(this.value, this.name);
}

class RackHome extends StatelessWidget {
  final icons = ['assets/images/user.png'];

  List<PopupItem> _list = [
    PopupItem(1, "Log Out"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context) as PreferredSizeWidget,
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
                        color: Colors.green,
                        onPressed: () {},
                        icon: Icon(
                          Icons.switch_camera,
                          // size: 50,
                        )),
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
                    labelPadding: EdgeInsets.only(left: 20, right: 20),
                    label: SizedBox(
                      width: 30,
                      child: Text('180'),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Chip(
                    backgroundColor: Colors.red,
                    labelPadding: EdgeInsets.only(left: 20, right: 20),
                    label: SizedBox(
                      width: 30,
                      child: Text('180'),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Chip(
                    backgroundColor: Colors.red,
                    labelPadding: EdgeInsets.only(left: 20, right: 20),
                    label: SizedBox(
                      width: 30,
                      child: Text('180'),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }

  Widget getAppBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
        child: Icon(Icons.arrow_back),
      ),
      backgroundColor: Colors.greenAccent[700],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(backgroundImage: AssetImage(icons[0])),
          Padding(padding: EdgeInsets.all(10), child: Text("Roshan")),
        ],
      ),
      actions: [
        PopupMenuButton(
            elevation: 20,
            enabled: true,
            onSelected: (value) {},
            itemBuilder: (context) {
              return _list.map((PopupItem choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice.name),
                );
              }).toList();
            })
      ],
    );
  }
}
