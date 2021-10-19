// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'jeson_data.dart';

// Categories
class Categories {
  static Future<List<Category>> getCategory() async {
    try {
      final res = await http.get(Uri.https("raw.githubusercontent.com",
          "vizodev/flutter_challenge/master/chalelnge_assets/api/home_specialists.json"));
      if (200 == res.statusCode) {
        final categories = categoryFromJson(res.body);
        return categories;
      } else {
        print("object");
      }
    } catch (e) {
      print(e);
    }
    return List.empty();
  }
}

// HeartSpecialists
class HeartSpecialistses {
  static Future<List<HeartSpecialists>> getHeartSpecialists() async {
    try {
      final res = await http.get(Uri.https("raw.githubusercontent.com",
          "vizodev/flutter_challenge/master/chalelnge_assets/api/list_specialist_heart.json"));
      if (200 == res.statusCode) {
        final heartSpecialists = heartSpecialistsFromJson(res.body);
        return heartSpecialists;
      } else {
        print("object");
      }
    } catch (e) {
      print(e);
    }
    return List.empty();
  }
}

// DentalCareSpecialists
class DentalCareSpecialistses {
  static Future<List<DentalCareSpecialists>> getDentalCareSpecialists() async {
    try {
      final res = await http.get(Uri.https("raw.githubusercontent.com",
          "vizodev/flutter_challenge/master/chalelnge_assets/api/list_specialist_dental_care.json"));
      if (200 == res.statusCode) {
        final dentalCareSpecialists = dentalCareSpecialistsFromJson(res.body);
        return dentalCareSpecialists;
      } else {
        print("object");
      }
    } catch (e) {
      print(e);
    }
    return List.empty();
  }
}

// DermatologySpecialists
class DermatologySpecialistses {
  static Future<List<DermatologySpecialists>>
      getDermatologySpecialists() async {
    try {
      final res = await http.get(Uri.https("raw.githubusercontent.com",
          "vizodev/flutter_challenge/master/chalelnge_assets/api/list_specialist_dermatology.json"));
      if (200 == res.statusCode) {
        final dermatologySpecialists = dermatologySpecialistsFromJson(res.body);
        return dermatologySpecialists;
      } else {
        print("object");
      }
    } catch (e) {
      print(e);
    }
    return List.empty();
  }
}
