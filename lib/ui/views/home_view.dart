import 'package:flutter/material.dart';
import 'package:new_smarthome_project/locator.dart';
import 'package:new_smarthome_project/models/device_data.dart';
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
                child: SingleChildScrollView(
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height / 1.3,
                            width: MediaQuery.of(context).size.width,
                            child: FutureBuilder(
                              future: model.getDataList(),
                              builder:
                                  (BuildContext context, AsyncSnapshot<List<Device>> snapshot){
                                if (snapshot.hasData) {
                                  List <Device> devices = snapshot.data;
                                  return Card(
                                    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 4),
                                    elevation: 7,
                                    child: ListView(
                                      children: devices.map(
                                              (Device device) => Container(
                                            child: ListTile(
                                              title: Text(
                                                'Device Name : ${device.name}',
                                              ),
                                              subtitle: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text('MAC : ${device.mac}'),
                                                        Text('Minor : ${device.minor}'),
                                                        Text('Quantity : ${device.quantity}'),
                                                        Text('Serial number : ${device.guid}'),
                                                        Text('Type : ${device.type}'),
                                                        Text('Version : ${device.version}'),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                      ).toList(),
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: Container(
                                      child: Text("No data"),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}
