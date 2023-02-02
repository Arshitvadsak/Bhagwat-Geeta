import 'package:bhagavad_gita_verses/screens/Verses_Page.dart';
import 'package:bhagavad_gita_verses/screens/Chapters_Page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Chapter_Page(),
        'Verses':(context) => Verses_Page(),
      },
    ),
  );
}

