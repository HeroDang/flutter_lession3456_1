import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lession3456_1/lession_listview.dart';

void main() {
  runApp(const MyCalculatorApp());
  // runApp(const MyCalculatorApp());
}

class MyCalculatorApp extends StatelessWidget {
  const MyCalculatorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final fieldTextA = TextEditingController();
  final fieldTextB = TextEditingController();
  double _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Container(
          alignment: AlignmentDirectional.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/calculator.png",
                width: 120,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: fieldTextA,
                  decoration: new InputDecoration(
                    hintText: "Nhap so A",
                    contentPadding: EdgeInsets.all(8),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: fieldTextB,
                  decoration: new InputDecoration(
                    hintText: "Nhap so B",
                    contentPadding: EdgeInsets.all(8),
                  ),
                  keyboardType: TextInputType.number,
                  // inputFormatters: [FilteringTextInputFormatter.digitsOnly]
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Ket qua " + _result.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (fieldTextA.text != "" && fieldTextB.text != "") {
                            int a = int.parse(fieldTextA.text);
                            int b = int.parse(fieldTextB.text);
                            setState(() {
                              _result = (a + b).toDouble();
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("A hoac B khong hop le!")));
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueAccent),
                        ),
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (fieldTextA.text != "" &&
                                fieldTextB.text != "") {
                              int a = int.parse(fieldTextA.text);
                              int b = int.parse(fieldTextB.text);
                              setState(() {
                                _result = (a - b).toDouble();
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("A hoac B khong hop le!")));
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.redAccent),
                          ),
                          child: Text(
                            "-",
                            style: TextStyle(fontSize: 20),
                          )),
                      SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (fieldTextA.text != "" &&
                                fieldTextB.text != "") {
                              int a = int.parse(fieldTextA.text);
                              int b = int.parse(fieldTextB.text);
                              setState(() {
                                _result = (a * b).toDouble();
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("A hoac B khong hop le!")));
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                          ),
                          child: Text("x", style: TextStyle(fontSize: 20))),
                      SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (fieldTextA.text != "" &&
                                fieldTextB.text != "") {
                              int a = int.parse(fieldTextA.text);
                              int b = int.parse(fieldTextB.text);
                              setState(() {
                                _result = (a / b).toDouble();
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("A hoac B khong hop le!")));
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orangeAccent),
                          ),
                          child: Text(":", style: TextStyle(fontSize: 20))),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ListViewScreen();
                    }));
                  },
                  child: Text("Go to screen 2")),
            ],
          ),
        ),
      ),
    );
  }
}
