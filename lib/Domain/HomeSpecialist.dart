enum SpecialistType { heart, dental, darmatology }

class HomeSpecialist {
  String name = "";
  // ignore: non_constant_identifier_names
  String image_url = "";
  int total = 0;

  // ignore: non_constant_identifier_names
  HomeSpecialist({name, image_url, total});

  HomeSpecialist.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image_url = json['image_url'],
        total = json['total'];
}
