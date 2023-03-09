import 'dart:math';

import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  final _random = new Random();

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
            SizedBox(
              height: 20,
            ),
            buildListView(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        countAddItem++;
                        entries.add(countAddItem.toString());
                        colorCodes.add(colorCodes[_random.nextInt(colorCodes
                            .length)]);
                      });
                    },
                    child: Text("Add item")),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (countAddItem != 0) {
                        setState(() {
                          countAddItem--;
                          entries.removeLast();
                          colorCodes.removeLast();
                        });
                      }
                    },
                    child: Text("Remove item")),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back to screen 1"))
          ],
        ),
      ),
    );
  }

  int countAddItem = 0;

  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F'];

  final List<int> colorCodes = <int>[600, 500, 400, 300, 200, 100];

  Widget buildListView() {
    return Container(
      height: 150,
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Item ${entries[index]}'))
              );
            },
            child: Container(
              height: 50,
              //color: Colors.blue[colorCodes[index]],
              child: Center(child: Text('Item ${entries[index]}')),
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },),
    );
  }
}
