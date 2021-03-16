import 'package:flutter/material.dart';


class AppBarWidget {

  AppBarWidget();

  PreferredSizeWidget AppBarWid(){
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined), // Put icon of your preference.
            onPressed: () {
              Navigator.of(context).pop();
              // your method (function),
            },
          );
        },
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      elevation: 0.0,

    );
  }

}
