import 'package:flutter/material.dart';
import 'package:new_smarthome_project/ui/shared/ui_helper.dart';
import 'package:new_smarthome_project/ui/views/qr_view.dart';
import 'package:new_smarthome_project/ui/widgets/textfield_widget.dart';
import 'package:new_smarthome_project/viewmodels/register_manual_view_model.dart';
import 'package:stacked/stacked.dart';

class RegisterManualView extends StatefulWidget {

  @override
  _RegisterManualViewState createState() => _RegisterManualViewState();
}

class _RegisterManualViewState extends State<RegisterManualView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RegisterManualViewModel(),
      builder: (context,model,child) => SafeArea(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.redAccent,
                title: Text("Smarthome"),
                actions: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => QRViewExample()));
                    },
                    child: Icon(Icons.qr_code_scanner),
                  ),
                  horizontalSpaceSmall
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 20),
                  child: Form(
                      child: Column(
                        children: <Widget>[
                          Text("Register Device", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                          TextFieldWidget(title: "Serial Number", controller: model.guidController,readOnly: false),
                          TextFieldWidget(title: "Device Name", controller: model.nameController, readOnly: false,),
                          TextFieldWidget(title: "Rules", controller: model.quantityController, readOnly: false),
                          TextFieldWidget(title: "Mac", controller: model.macController, readOnly: false),
                          TextFieldWidget(title: "Type", controller: model.typeController, readOnly: false),
                          TextFieldWidget(title: "Version", controller: model.versionController, readOnly: false),
                          TextFieldWidget(title: "Minor", controller:model.minorController, readOnly: false),
                          MaterialButton(
                              padding: EdgeInsets.all(5),
                              child:Container(
                                child: Text('Submit',style: TextStyle(fontSize: 15),),decoration: BoxDecoration(
                                  color: Colors.blue
                              ),
                              ),
                              onPressed: (){
                                model.RegisterDevice(context);

                              })
                        ],
                      )
                  ),
                ),
              )
          ),
      ),
    );
  }
}
