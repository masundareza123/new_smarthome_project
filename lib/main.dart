import 'package:flutter/material.dart';
import 'package:new_smarthome_project/ui/views/home_view.dart';
import 'package:new_smarthome_project/ui/views/register_device_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterDeviceView(),
    );
  }
}

