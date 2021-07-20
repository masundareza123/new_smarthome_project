import 'package:flutter/material.dart';
import 'package:new_smarthome_project/constants/route_name.dart';
import 'package:new_smarthome_project/ui/views/home_view.dart';
import 'package:new_smarthome_project/ui/views/qr_view.dart';
import 'package:new_smarthome_project/ui/views/register_device_view.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name){
    case HomeViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: HomeView()
      );
    case RegisterDeviceViewRoute:
      return _pageRoute(
          routeName: settings.name,
          viewToShow: RegisterDeviceView()
      );
    case QrViewRoute:
      return _pageRoute(
          routeName: settings.name,
          viewToShow: QRViewExample()
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
            ),
          ),
        ),
      );
  }
}
  PageRoute _pageRoute({String routeName, Widget viewToShow}) {
    return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow,
    );
  }
