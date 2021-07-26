import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:new_smarthome_project/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class RegisterDeviceViewModel extends BaseModel {
  TextEditingController guidController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController macController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController versionController = TextEditingController();
  TextEditingController minorController = TextEditingController();

  // String guid;
  // String mac;
  // String type;
  // String quantity;
  // String name;
  // String version;
  // String minor;

  Future<void> getTask() async {
    Showdata();
    print('OnMode');

  }

  void Showdata()async{
    setBusy(true);
    // guidController.text='123';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data=prefs.getString('datadevice');
    var result = convert.jsonDecode(data);
    // final datadevice = json.decode(data);
    print('datadevice ${data}');
        var guid=result['guid'];
        var name=result['name'];
        var type= result['type'];
        var mac =result['mac'];
        // var quantity=result['quantity'];
        var version=result['version'];
        var minor=result['minor'];
    // print('ini guidnya:${guid}');
    guidController.text=guid;
    nameController.text=name;
    typeController.text=type;
    macController.text=mac;
    versionController.text=version;
    minorController.text=minor;
    setBusy(false);
    // guidController.text=guid;
    // guidController='123'
    // guidController.text='123';
  }

// void Save

}