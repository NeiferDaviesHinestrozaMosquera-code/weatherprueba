import 'package:flutter/material.dart';

getOtherScreenAppBar(
    String title, VoidCallback onPressed, BuildContext context) {
  return AppBar(
    toolbarHeight: 80,
    elevation: 0,
    title: Text(title),
    centerTitle: true,
    actions: [IconButton(icon: const Icon(Icons.refresh), onPressed: onPressed)],
    shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(20)), //SIRVE PARA DAR FORMA AL APPBAR
    flexibleSpace: Stack(alignment: Alignment.bottomCenter, children: [
      Container(
        height: 250,
        color: Colors.blue.shade100,
      ),
      Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        height: 20,
      )
    ]),
  );
}
