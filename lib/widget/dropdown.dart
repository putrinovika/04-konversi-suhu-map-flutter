import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/services.dart';

class Dropdown extends StatelessWidget {
  const Dropdown(
      {Key? key,
      required this.listSuhu,
      required this.selectedDropdown,
      required this.onChangedDropdown})
      : super(key: key);

  final List<String> listSuhu;
  final String selectedDropdown;
  final Function(dynamic) onChangedDropdown;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        items: listSuhu.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          );
        }).toList(),
        value: selectedDropdown,
        onChanged: onChangedDropdown);
  }
}
