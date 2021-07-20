import 'package:flutter/material.dart';
import 'package:new_smarthome_project/ui/shared/ui_helper.dart';
import 'package:new_smarthome_project/ui/widgets/button_data.dart';

class HomeView extends StatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text("Smarthome"),
            actions: [
              Icon(Icons.qr_code_scanner,
                color: Colors.white,
              ),
              horizontalSpaceSmall
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              child: ButtonData(),
            )
          ),
        ),
    );
  }
}
