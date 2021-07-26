import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:new_smarthome_project/models/device_data.dart';
import 'package:new_smarthome_project/ui/shared/ui_helper.dart';
import 'package:new_smarthome_project/ui/views/qr_view.dart';
import 'package:new_smarthome_project/ui/widgets/textfield_widget.dart';
import 'package:new_smarthome_project/viewmodels/register_view_model.dart';
import 'package:stacked/stacked.dart';


class RegisterDeviceView extends StatefulWidget {

  @override
  _RegisterDeviceViewState createState() => _RegisterDeviceViewState();
}

class _RegisterDeviceViewState extends State<RegisterDeviceView> {
  RegisterDeviceViewModel model=RegisterDeviceViewModel();

  // TextEditingController guidController = TextEditingController();
  // TextEditingController nameController = TextEditingController();
  // TextEditingController macController = TextEditingController();
  // TextEditingController typeController = TextEditingController();
  // TextEditingController versionController = TextEditingController();
  // TextEditingController minorController = TextEditingController();
  // TextEditingController test = TextEditingController();

  Device device;
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
  String _myActivity;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
  }
  @override
  Widget build(BuildContext context) {

    // print(sh)
    // ReactiveViewModel.
    // test.text = 'text';
    // guidController.text = '${device.guid}';
    // nameController.text = '${device.name}';
    // macController.text = '${device.mac}';
    // typeController.text = '${device.type}';
    // versionController.text = '${device.version}';
    // minorController.text = '${device.minor}';
    // print('${device.guid}');
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RegisterDeviceViewModel(),

      onModelReady: (model) {
        model.getTask();
        // model.Swowdata();
        // print(model.busy);
        // model.openLocationSetting();
        // model.getTask();
      },
      builder: (context,model,child) => SafeArea(
        // mode
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
                          TextFieldWidget(title: "Serial Number", controller: model.guidController,readOnly: true,),
                          TextFieldWidget(title: "Device Name", controller: model.nameController, readOnly: false,),
                          /*SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  initialValue: 'circle',
                  icon: Icon(Icons.format_shapes),
                  labelText: 'Shape',
                  items: _items,
                  onChanged: (val) => print(val),
                  onSaved: (val) => print(val),
                ),*/
                          DropDownFormField(
                            titleText: 'Select The Rules',
                            hintText: 'Please choose one',
                            // contentPadding: ,
                            value: _myActivity,
                            onSaved: (value) {
                              setState(() {
                                model.qtyController = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                _myActivity = value;
                              });
                            },
                            dataSource: [
                              {
                                "display": "Rule 1",
                                "value": "1",
                              },
                              {
                                "display": "Rule 2",
                                "value": "11",
                              },
                              {
                                "display": "Rule 3",
                                "value": "111",
                              },
                              {
                                "display": "Rule 4",
                                "value": "1111",
                              },
                              {
                                "display": "Rule 5",
                                "value": "11111",
                              },
                              {
                                "display": "Rule 6",
                                "value": "111111",
                              },
                              {
                                "display": "Rule 7",
                                "value": "1111111",
                              },
                              {
                                "display": "Rule 8",
                                "value": "11111111",
                              },
                            ],
                            textField: 'display',
                            valueField: 'value',
                          ),
                          // model.showdata()
                          TextFieldWidget(title: "Mac", controller: model.macController, readOnly: true),
                          TextFieldWidget(title: "Type", controller: model.typeController, readOnly: true),
                          TextFieldWidget(title: "Version", controller: model.versionController, readOnly: true),
                          TextFieldWidget(title: "Minor", controller:model.minorController, readOnly: true),


                          MaterialButton(
                            padding: EdgeInsets.all(5),
                            child:Container(
                              child: Text('Submit',style: TextStyle(fontSize: 15),),decoration: BoxDecoration(
                              color: Colors.blue
                            ),
                            ),
                              onPressed: (){
                            model.RegisterDevice();

                          })
                        ],
                      )
                  ),
                ),
              )
          )
      ),
    );
  }
}
