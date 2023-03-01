import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app', // used by the OS task switcher
      home: buildHomeScreen(),
    ),
  );
}

Widget buildHomeScreen () {
  return Scaffold(
    appBar: AppBar(
      title: Text('My Test Home Page'),
    ),
    body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Screen'),
            SizedBox(
              height: 20,
            ),
            Image.network('https://codefresher.vn/wp-content/uploads/2022/10/Banner-06-Java-core-848x548.jpg',
            width: 250,)
          ],
        )),
  );
}