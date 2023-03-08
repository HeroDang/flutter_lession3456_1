

import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("List Screen"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 150,
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(child: Text('Entry A')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[500],
                    child: const Center(child: Text('Entry B')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),

            buildListView(),

            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Back to screen 1"))
          ],
        ),
      ),
    );
  }

  Widget buildListView(){
    final List<String> entries = <String>['A', 'B', 'C','D', 'E', 'F'];
    final List<int> colorCodes = <int>[600, 500, 400, 300, 200, 100];
    return Container(
      height: 150,
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.blue[colorCodes[index]],
              child: Center(child: Text('Item ${entries[index]}')),
            );
          }
      ),
    );
  }
}