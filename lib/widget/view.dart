import 'package:flutter/material.dart';

class View extends StatelessWidget {
  const View({Key? key, required this.listView}) : super(key: key);

  final List listView;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: listView.map(
        (value) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              value.toString(),
              style: const TextStyle(fontSize: 20),
            ),
          );
        },
      ).toList(),
    );
  }
}
