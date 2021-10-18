import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_challenge/api/jeson_data.dart';
import 'package:flutter_challenge/secondary_screen/specialists.dart';
import '../api/jeson_data.dart';
import '../api/api.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  late List<Category> _categories = [];
  @override
  void initState() {
    super.initState();
    Categories.getCategory().then((categories) {
      setState(() {
        _categories = categories;
      });
    });
  }

  Widget build(BuildContext context) {
    // Category selector
    return Container(
      height: 220.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          itemBuilder: (BuildContext contaxt, index) {
            Category category = _categories[index];
            String total = category.total.toString() + " Doctors";
            String imag = category.imageUrl.toString();

            return GestureDetector(
              child: Container(
                width: 160.0,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: HexColor(category.color ?? "#E5495E"),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.network(
                          imag,
                          placeholderBuilder: (context) =>
                              CircularProgressIndicator(),
                          height: 128.0,
                          color: HexColor(category.color ?? "#E5495E"),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Text(
                      category.name ?? "fffff",
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                    Spacer(),
                    Text(
                      total,
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    Spacer(
                      flex: 5,
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SpecialistsSelector(data: category.name)),
                );
              },
            );
          }),
    );
  }
}

class HexColor extends Color {
  // use to accept usage of String in Color
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
