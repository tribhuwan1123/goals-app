import 'package:flutter/material.dart';
import 'package:fitness/model/radio_model.dart';

class CustomRadio extends StatelessWidget {
  RadioModel _radio;
  CustomRadio(this._radio);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: _radio.isSelected ? Color(0xFF3B4257) : Colors.white,
        child: Container(
          height: 80,
          width: 80,
          alignment: Alignment.center,
          margin: new EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                _radio.icon,
                color: _radio.isSelected ? Colors.white : Colors.grey,
                size: 40,
              ),
              SizedBox(height: 10),
              Text(
                _radio.name,
                style: TextStyle(
                    color: _radio.isSelected ? Colors.white : Colors.grey),
              )
            ],
          ),
        ));
  }
}
