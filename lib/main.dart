// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:world_time/screens/home.dart';
import 'package:world_time/screens/choose_location.dart';
import 'package:world_time/screens/loading.dart';
// import 'package:world_time/services/world_time.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
    },
  ));
}
