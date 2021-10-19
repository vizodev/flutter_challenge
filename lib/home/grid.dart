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
        name: "Diagnostic",
        icon: "https://www.svgrepo.com/show/142962/stethoscope.svg"),
    AddIcons(
        name: "Consulatoin",
        icon:
            "https://www.svgrepo.com/show/119186/person-with-headset-thin-outline-symbol-in-a-circle.svg"),
    AddIcons(
        name: "Nurse", icon: "https://www.svgrepo.com/show/295869/nurse.svg"),
    AddIcons(
        name: "Ambulance",
        icon: "https://www.svgrepo.com/show/105740/ambulance.svg"),
    AddIcons(
        name: "Lab Work",
        icon:
            "https://www.svgrepo.com/show/338091/erlenmeyer-laboratory-lab-experiment-flask-science-medical.svg"),
    AddIcons(
        name: "Medicine",
        icon: "https://www.svgrepo.com/show/106386/medicine.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    var textColor = Color.fromRGBO(80, 76, 76, 1);

    return Expanded(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Align(
            heightFactor: 0.1,
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(""),
                Text(
                  "What do you need?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: textColor,
                  ),
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
                  child: Container(
                    margin: EdgeInsets.all(9.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        color: selected == index
                            ? Color.fromRGBO(202, 73, 229, 1)
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          )
                        ]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70.0,
                            padding: const EdgeInsets.all(15.0),
                            child: SvgPicture.network(
                              list.icon.toString(),
                              placeholderBuilder: (context) =>
                                  CircularProgressIndicator(),
                              height: 128.0,
                              color:
                                  selected == index ? Colors.white : textColor,
                            ),
                          ),
                          Text(
                            list.name.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color:
                                  selected == index ? Colors.white : textColor,
                            ),
                          ),
                        ]),
                  ),
                );
              }),
            ),
          ),
        ),
      ]),
    );
  }
}
