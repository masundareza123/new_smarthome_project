import 'package:flutter/material.dart';
import 'package:new_smarthome_project/ui/shared/ui_helper.dart';
import 'package:new_smarthome_project/ui/widgets/textfield_widget.dart';

class RegisterDeviceView extends StatefulWidget {

  @override
  _RegisterDeviceViewState createState() => _RegisterDeviceViewState();
}

class _RegisterDeviceViewState extends State<RegisterDeviceView> {
  TextEditingController guidController = TextEditingController();
  TextEditingController test = TextEditingController();
  /*final List<Map<String, dynamic>> _items = [
    {
      'value': '1',
      'label': 'Value 1',
    },
    {
      'value': '11',
      'label': 'Value 2',
    },
    {
      'value': '111',
      'label': 'Value 3',
    },
    {
      'value': '1111',
      'label': 'Value 4',
    },
    {
      'value': '11111',
      'label': 'Value 5',
    },
    {
      'value': '111111',
      'label': 'Value 6',
    },
    {
      'value': '1111111',
      'label': 'Value 7',
    },
    {
      'value': '11111111',
      'label': 'Value 8',
    },
  ];*/
  /*String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }*/
  @override
  Widget build(BuildContext context) {
    test.text = 'text';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Registration Device", style: TextStyle(color: Colors.black),),
          elevation: 0,
          actions: [
            Icon(Icons.qr_code_scanner, color: Colors.black,),
            horizontalSpaceSmall
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 20),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFieldWidget(title: "Serial Number", controller: test, readOnly: true,),
                  TextFieldWidget(title: "Device Name", controller: test, readOnly: false,),
                  /*SelectFormField(
                    type: SelectFormFieldType.dropdown, // or can be dialog
                    labelText: 'Select Value',
                    items: _items,
                    onChanged: (val) => print(val),
                    onSaved: (val) => print(val),
                  ),*/
                  /*DropDownFormField(
                    titleText: 'My workout',
                    hintText: 'Please choose one',
                    value: _myActivity,
                    onSaved: (value) {
                      setState(() {
                        _myActivity = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _myActivity = value;
                      });
                    },
                    dataSource: [
                      {
                        "display": "Running",
                        "value": "Running",
                      },
                      {
                        "display": "Climbing",
                        "value": "Climbing",
                      },
                      {
                        "display": "Walking",
                        "value": "Walking",
                      },
                      {
                        "display": "Swimming",
                        "value": "Swimming",
                      },
                      {
                        "display": "Soccer Practice",
                        "value": "Soccer Practice",
                      },
                      {
                        "display": "Baseball Practice",
                        "value": "Baseball Practice",
                      },
                      {
                        "display": "Football Practice",
                        "value": "Football Practice",
                      },
                    ],
                    textField: 'display',
                    valueField: 'value',
                  ),*/
                  TextFieldWidget(title: "Mac", controller: test, readOnly: true),
                  TextFieldWidget(title: "Type", controller: test, readOnly: true),
                  TextFieldWidget(title: "Version", controller: test, readOnly: true),
                  TextFieldWidget(title: "Minor", controller: test, readOnly: true)
                ],
              )
            ),
          ),
        )
      )
    );
  }
}
