import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RectangleToggleButton extends StatefulWidget {
  List<bool> isSelected;
  final List<String> options;
  final Function(List<bool>) onChanged;

  RectangleToggleButton({
    Key? key,
    required this.isSelected,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RectangleToggleButtonState createState() => _RectangleToggleButtonState();
}

class _RectangleToggleButtonState extends State<RectangleToggleButton> {
  void _onToggle(int index) {
  setState(() {
    widget.isSelected = List.generate(widget.isSelected.length, (i) => i == index);
    widget.onChanged(widget.isSelected);
  });
}


  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(5.0),
      isSelected: widget.isSelected,
      onPressed: _onToggle,
      color: Colors.grey,
      selectedColor: Colors.white,
      
      
      fillColor: Color(0xFFC1121F),
      selectedBorderColor: Color(0xFFC1121F),
      children: <Widget>[
        Container(
          width: Get.width/2.2,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Text(
            widget.options[0],
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: Get.width/2.2,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Text(
            widget.options[1],
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
