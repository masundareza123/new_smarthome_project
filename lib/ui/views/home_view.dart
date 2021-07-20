import 'package:flutter/material.dart';
import 'package:new_smarthome_project/locator.dart';
import 'package:new_smarthome_project/services/navigator_service.dart';
import 'package:new_smarthome_project/ui/shared/ui_helper.dart';
import 'package:new_smarthome_project/ui/views/qr_view.dart';
import 'package:new_smarthome_project/ui/widgets/button_data.dart';
import 'package:new_smarthome_project/viewmodels/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context,model,child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text("Smarthome"),
            actions: [
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QRViewExample()));
                },
                child: Icon(Icons.qr_code_scanner),
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
      ),
    );
  }
}
