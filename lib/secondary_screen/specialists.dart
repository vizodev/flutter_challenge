import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_challenge/home/bottomAppBar.dart';
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
        });
      });
    }
  }

  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 100), () {
      _loading = true;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("SpecialistsList"),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Spacer(
            flex: 20,
          ),
          Icon(Icons.sort_outlined),
          Spacer(),
        ],
      ),
      body: _loading
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _specialistsList.length,
              itemBuilder: (BuildContext contaxt, index) {
                var specialists = _specialistsList[index];

                // craetAlertDdialog(BuildContext context) {
                //   return showDialog(
                //       context: context,
                //       builder: (context) {
                //         return AlertDialog(
                //           title: Text("title"),
                //           content: Text("specialists"),
                //           actions: <Widget>[
                //             MaterialButton(
                //                 elevation: 5.0,
                //                 child: Text(
                //                   "OK",
                //                   style: TextStyle(color: Colors.blue),
                //                 ),
                //                 onPressed: () {
                //                   Navigator.of(context).pop();
                //                 })
                //           ],
                //         );
                //       });
                // }

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
                      subtitle: Column(children: [
                        Text(
                          specialists.description ?? "nachman",
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10.0),
                                height: 40,
                                width: 130,
                                child: FloatingActionButton.extended(
                                  onPressed: () {},
                                  label: const Text(
                                    'Chat',
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  backgroundColor: Colors.blue,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10.0),
                                height: 40,
                                width: 130,
                                child: FloatingActionButton.extended(
                                  onPressed: () {
                                    // craetAlertDdialog(context);
                                  },
                                  label: const Text(
                                    'Call',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ])
                      ]),
                    ),
                  ),
                );
              })
          : Simmer(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
