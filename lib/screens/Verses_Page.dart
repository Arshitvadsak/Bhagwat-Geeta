import 'package:flutter/material.dart';

class Verses_Page extends StatefulWidget {
  const Verses_Page({
    Key? key,
  }) : super(key: key);

  @override
  State<Verses_Page> createState() => _Verses_PageState();
}

class _Verses_PageState extends State<Verses_Page> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> ABC =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chapter ${ABC['chapter_number']}",
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...ABC['verses']
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(20),
                    child: GestureDetector(
                      child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width / 1.1,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black12),
                          child: Column(
                            children: [
                              Text(
                                " verse ${e['verse_number']}",
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "${e["text"]}",
                                style: const TextStyle(fontSize: 15),
                              ),
                            ],
                          )),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
