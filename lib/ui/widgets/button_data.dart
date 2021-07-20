import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_smarthome_project/ui/shared/ui_helper.dart';

class ButtonData extends StatefulWidget {

  @override
  _ButtonDataState createState() => _ButtonDataState();
}

class _ButtonDataState extends State<ButtonData> {
  bool index = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.redAccent, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(3, 6),
              blurRadius: 10,
            ),
          ],
        ),
        child: InkWell(
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Container(
                  width: 200,
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.lightbulb, size: 26,),
                      horizontalSpaceSmall,
                      Text("Saklar 1", style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: InkWell(
                  splashColor: Colors.white,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.decelerate,
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                        color: index ? Colors.black : Colors.redAccent
                      ),
                      color: index ? Colors.redAccent : Colors.white,
                    ),
                    child: AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      alignment: index ? Alignment.centerRight : Alignment.centerLeft,
                      curve: Curves.decelerate,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: index ? Colors.white : Colors.redAccent,
                              borderRadius: BorderRadius.circular(100)
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: (){
                    setState(() {
                      index =! index;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
