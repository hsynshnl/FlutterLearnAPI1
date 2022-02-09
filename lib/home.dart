import 'package:flutter/material.dart';
import 'package:flutter_learn/local_json.dart';
import 'package:flutter_learn/remote_api.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LocalJson()));
              },
              child: Text("Local Host"),
            ),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => RemoteApi()));
              },
              child: Text("Api Host"),
            ),
          ),
        ],
      ),
    );
  }
}
