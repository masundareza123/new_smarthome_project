import 'package:new_smarthome_project/models/device_data.dart';
import 'package:new_smarthome_project/services/sqflite_service.dart';
import 'package:new_smarthome_project/viewmodels/base_model.dart';
import 'package:sqflite/sqflite.dart';

import '../locator.dart';

class HomeViewModel extends BaseModel {
  Db database = Db();
  Device device;

  final Db _db = locator <Db>();

  Future<List<Device>> getDataList() async{
    List<Device> deviceList;
    final Future<Database> dbFuture = database.getDatabaseInstance();

    await dbFuture.then((databaseOPEN) async {
      Future<List<Device>> deviceListFuture = database.getAllDevice();
      deviceList = await deviceListFuture.then((value) => value);
    });
    print(deviceList);
    return deviceList;
  }
}