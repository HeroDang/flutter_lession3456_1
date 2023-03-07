import 'dart:math';

import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app', // used by the OS task switcher
      home: MyHomeScreen(),
    ),
  );
}

class MyHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeScreenState();
  }

}

class MyHomeScreenState extends State<MyHomeScreen>{
  List<Color> colors = <Color>[Colors.orange, Colors.blue,Colors.green];
  Color bg = Colors.transparent;
  int count = 0;

  void ChangeBackgroungColor() {
    count++;
    if(count % 2 == 0){
      // generates a new Random object
      final _random = new Random();
      // generate a random index based on the list length
      // and use it to retrieve the element
      Color element = colors[_random.nextInt(colors.length)];
      setState(() {
        bg = element;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('My Test Home Page'),
      ),
      body: Container(
          color: bg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Home Screen',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              buildRowLayout(),
              SizedBox(
                height: 20,
              ),
              Image.network('https://codefresher.vn/wp-content/uploads/2022/10/Banner-06-Java-core-848x548.jpg',
                width: 250,),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: ChangeBackgroungColor,
                  child: Text("Change color")),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {
                setState(() {
                  bg = Colors.transparent;
                });
              },
                  child: Text("Restart")),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Nut da duoc bam!")));
              },
                  child: Text("Click me!"))
            ],
          )),
    );
  }
}


Widget buildRowLayout () {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.blue,
          height: 100,
          width: 100,
        ),
        Container(
          color: Colors.green,
          height: 100,
          width: 100,
        ),
        Container(
          color: Colors.orange,
          height: 100,
          width: 100,
        ),
      ]);
}