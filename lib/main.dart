import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/services.dart';
import 'package:konversi_suhu_mapflutter/widget/conversion.dart';
import 'package:konversi_suhu_mapflutter/widget/dropdown.dart';
import 'package:konversi_suhu_mapflutter/widget/input.dart';
import 'package:konversi_suhu_mapflutter/widget/result.dart';
import 'package:konversi_suhu_mapflutter/widget/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  String _selectedDropdown = "Kelvin";
  double _result = 0;
  final inputController = TextEditingController();

  List listHasil = [];
  var listSuhu = ["Kelvin", "Reamur", "Fahrenheit", "Celcius"];

  onChangedDropdown(newValue) {
    setState(() {
      _selectedDropdown = newValue;
      perhitunganSuhu();
    });
  }

  perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_selectedDropdown == "Kelvin") {
        _result = _inputUser + 273;
        listHasil.add('Kelvin : $_result');
      } else if (_selectedDropdown == "Reamur") {
        _result = (4 / 5) * _inputUser;
        listHasil.add('Reamur : $_result');
      } else if (_selectedDropdown == "Fahrenheit") {
        _result = (9 / 5) * _inputUser + 32;
        listHasil.add('Fahrenheit : $_result');
      } else {
        _result = _inputUser;
        listHasil.add('Celcius : $_result');
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Konverter Suhu"),
          ),
          body: Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(children: [
              const Text(
                'Putri Novika Arini',
              ),
              const Text(
                '2031710067',
              ),
              const SizedBox(
                height: 25,
              ),
              Input(inputController: inputController),
              const SizedBox(
                height: 10,
              ),
              Dropdown(
                  listSuhu: listSuhu,
                  selectedDropdown: _selectedDropdown,
                  onChangedDropdown: onChangedDropdown),
              Result(result: _result),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              Convert(konvertHandler: perhitunganSuhu),
              const Text(
                '\n Riwayat Konversi',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: View(listView: listHasil))
            ]),
          ),
        ));
  }
}
