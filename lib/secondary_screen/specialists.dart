import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_challenge/secondary_screen/shimer.dart';
import '../api/api.dart';
import 'dart:async';

// ignore: must_be_immutable
class SpecialistsSelector extends StatefulWidget {
  String? data;
  SpecialistsSelector({this.data});

  @override
  _SpecialistsSelectorState createState() => _SpecialistsSelectorState(data);
}

class _SpecialistsSelectorState extends State<SpecialistsSelector> {
  String? data;
  _SpecialistsSelectorState(this.data);
  List _specialistsList = [];

  List<String> category = [
    "Heart Specialist",
    "Dental Care",
    "Dermatology Specialist",
  ];

  late bool _loading;
  @override
  void initState() {
    super.initState();
    _loading = false;

    if (data == category[0]) {
      HeartSpecialistses.getHeartSpecialists().then((heartSpecialists) {
        setState(() {
          _specialistsList = heartSpecialists;
        });
      });
    } else if (data == category[1]) {
      DentalCareSpecialistses.getDentalCareSpecialists()
          .then((dentalCareSpecialists) {
        setState(() {
          _specialistsList = dentalCareSpecialists;
        });
      });
    } else if (data == category[2]) {
      DermatologySpecialistses.getDermatologySpecialists()
          .then((dermatologySpecialists) {
        setState(() {
          _specialistsList = dermatologySpecialists;
          print(dermatologySpecialists);
        });
      });
    }
  }

  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 500), () {
      _loading = true;
    });
    return _loading
        ? Scaffold(
            appBar: AppBar(
              title: Text("SpecialistsList"),
            ),
            body: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _specialistsList.length,
                itemBuilder: (BuildContext contaxt, index) {
                  var specialists = _specialistsList[index];

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 17.0, horizontal: 7.0),
                      child: ListTile(
                        title: Text(
                          specialists.name ?? "nachman",
                        ),
                        leading: Icon(
                          Icons.account_circle,
                          size: 54.0,
                        ),
                        subtitle: Text(
                          specialists.description ?? "nachman",
                        ),
                      ),
                    ),
                  );
                }),
          )
        : Simmer();
  }
}
