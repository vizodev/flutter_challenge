import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Simmer extends StatefulWidget {
  const Simmer({Key? key}) : super(key: key);

  @override
  _SimmerState createState() => _SimmerState();
}

class _SimmerState extends State<Simmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 11,
          itemBuilder: (context, index) {
            return Container(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[400]!,
                highlightColor: Colors.grey[100]!,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    title: Container(
                      width: 100,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                      ),
                    ),
                    leading: Icon(
                      Icons.account_circle,
                      size: 54.0,
                    ),
                    subtitle: Container(
                      width: 300.0,
                      height: 14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
