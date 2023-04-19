import 'package:flutter/material.dart';
import 'package:flutter_application_3/push_result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PushResult pushResult = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Coba Lagi"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text((pushResult != null)
                  ? pushResult.id +
                      "|" +
                      pushResult.job +
                      "|" +
                      pushResult.name +
                      "|" +
                      pushResult.created
                  : "data tidak ada"),
              RaisedButton(
                onPressed: () {
                  PushResult.koneksiApi("Ghania", "IT ").then((value) {
                    pushResult = value;
                    setState(() {});
                  });
                },
                child: Text("PUSH"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
