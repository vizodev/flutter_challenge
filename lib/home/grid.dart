import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Needs extends StatefulWidget {
  @override
  _NeedsState createState() => _NeedsState();
}

class AddIcons {
  String? name;
  String? icon;

  AddIcons({this.name, this.icon});
}

class _NeedsState extends State<Needs> {
  int selected = -1;
  List<AddIcons> listIcons = [
    AddIcons(
        name: "Diagnostic", icon: "assets\ambulance-transport-svgrepo-com.svg"),
    AddIcons(name: "bbbb", icon: "assets\icons\nurse.svg"),
    AddIcons(name: "ccccc", icon: "assets\icons\nurse.svg"),
    AddIcons(name: "dddd", icon: "assets\icons\nurse.svg"),
    AddIcons(name: "eee", icon: "assets\icons\nurse.svg"),
    AddIcons(name: "hhhhh", icon: "assets\icons\nurse.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              heightFactor: 0.1,
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "What do you need?",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100.0,
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                children: List.generate(6, (index) {
                  AddIcons list = listIcons[index];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        // ontap of each card, set the defined int to the grid view index
                        selected = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          color: selected == index
                              ? Colors.blue[800]
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                // child: SvgPicture.asset(
                                //     "assets\ambulance-transport-svgrepo-com.svg")
                                ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                "assets\ambulance-transport-svgrepo-com.svg",
                                placeholderBuilder: (context) =>
                                    CircularProgressIndicator(),
                                height: 128.0,
                                color: Colors.amber,
                              ),
                            ),
                            Text(list.name.toString()),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
