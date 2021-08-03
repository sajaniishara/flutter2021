import 'package:flutter/material.dart';

class PopupItem {
  int value;
  String name;
  PopupItem(this.value, this.name);
}

abstract class BaseStateless extends StatelessWidget {
  final icons = ['assets/images/user.png'];

  final List<PopupItem> _list = [
    PopupItem(1, "Log Out"),
  ];

  Widget appBar(BuildContext context) {
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
