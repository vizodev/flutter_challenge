class Specialist {
  String name = "";
  String description = "";
  double distance = 0.0;
  String chat = "";
  String call = "";

  Specialist({name, description, distance, chat, call});

  Specialist.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        distance = json['distance'],
        chat = json["actions"]["chat"],
        call = json["actions"]["call"];
}
