import 'package:get_it/get_it.dart';
import 'package:new_smarthome_project/services/navigator_service.dart';
import 'package:new_smarthome_project/services/rmq_service.dart';
import 'package:new_smarthome_project/services/sqflite_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => RMQService());
  locator.registerLazySingleton(() => Db());
}