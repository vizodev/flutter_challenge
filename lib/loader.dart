import 'package:flutter/material.dart';

//Loader widget
class LoaderHUD extends StatefulWidget {
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final bool dismissible;
  final Widget child;

  LoaderHUD({
    required Key key,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.dismissible = false,
    required this.child,
  }) : super(key: key);

  @override
  _LoaderHUDState createState() => _LoaderHUDState();
}

class _LoaderHUDState extends State<LoaderHUD> {
  Widget build(BuildContext context) {
    if (!widget.inAsyncCall) return widget.child;
    return Stack(
      alignment: Alignment.center,
      children: [
        widget.child,
        Opacity(
          child: ModalBarrier(
              dismissible: widget.dismissible, color: widget.color),
          opacity: widget.opacity,
        ),
        buildLoader(),
      ],
    );
  }

  Widget buildLoader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 75,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Center(
              child: Text(
            "authenticating",
            style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.white),
          )),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 80,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 150,
              child: LinearProgressIndicator(
                backgroundColor: Color(0xFFF0F0F0),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                minHeight: 4,
                semanticsLabel: 'Linear progress indicator',
              ),
            ),
          ],
        )
      ],
    );
  }
}
