import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Chapter_Page extends StatefulWidget {
  const Chapter_Page({Key? key}) : super(key: key);

  @override
  State<Chapter_Page> createState() => _Chapter_PageState();
}

class _Chapter_PageState extends State<Chapter_Page> {
  List finalResult = [];

  void decodeData() async {
    var jsonData = await rootBundle.loadString("assets/json/chapterdata.json");
    List decodeData = jsonDecode(jsonData);

    setState(() {
      finalResult = decodeData;
    });
  }

  @override
  void initState() {
    super.initState();
    decodeData();
  }

  var style =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bhagavad Gita"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: finalResult.length,
        itemBuilder: (context, index) => Card(
          elevation: 5,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.teal),
          ),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(
                  context, arguments: finalResult[index], 'Verses');
            },
            title: Center(
              child: Text(
                "Chapter ${finalResult[index]['chapter_number']}",
                style: style,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
