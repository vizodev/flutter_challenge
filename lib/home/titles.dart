import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../api/api.dart';

class TitlePage extends StatefulWidget {
  @override
  _TitlePageState createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  // late bool _loading;

  @override
  void initState() {
    super.initState();
    Categories.getCategory().then((categories) {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    var textColor = Color.fromRGBO(80, 76, 76, 1);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Hello",
                style: TextStyle(
                  fontSize: 25.0,
                  color: textColor,
                )),
            Text(
              "Lorelle luna",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                color: textColor,
              ),
            ),
            Text(""),
            Text(""),
            Text(""),
            Text(
              "Specialist",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
