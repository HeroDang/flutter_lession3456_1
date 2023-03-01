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

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('My Test Home Page'),
      ),
      body: Center(
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