import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:new_smarthome_project/constants/route_name.dart';
import 'package:new_smarthome_project/locator.dart';
import 'package:new_smarthome_project/models/device_data.dart';
import 'package:new_smarthome_project/services/navigator_service.dart';
import 'package:new_smarthome_project/services/sqflite_service.dart';
import 'package:new_smarthome_project/viewmodels/base_model.dart';

class RegisterManualViewModel extends BaseModel {
  TextEditingController guidController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController macController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController versionController = TextEditingController();
  TextEditingController minorController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  Device device;
  final Db _db = locator<Db>();
  final NavigationService _navigationService = locator<NavigationService>();

  // Future<void> getTask() async {
  //
  //
  // }


  void RegisterDevice(BuildContext context)async{

    try{
      if (guidController.text.length > 0 &&
          macController.text.length > 0 &&
          typeController.text.length > 0 &&
          quantityController.text.length > 0 &&
          nameController.text.length > 0 &&
          versionController.text.length > 0 &&
          minorController.text.length > 0) {
        var guid = guidController.text;
        var mac = macController.text;
        var type = typeController.text;
        var quantity = quantityController.text;
        var name = nameController.text;
        var version = versionController.text;
        var minor = minorController.text;
        //guid TEXT PRIMARY KEY, mac TEXT, type TEXT, quantity TEXT, name TEXT, version TEXT, minor TEXT
        device = Device(
            guid,
            mac,
            minor,
            name,
            quantity,
            type,
            version

        );
        print("this is serial number $guid");
        print(device.toMap().toString());
        await _db.addDevice(device);
        print('$device');
        print("added");
        _navigationService.navigateTo(DashboardViewRoute);
      }
    }catch(e){

    }

  }

}