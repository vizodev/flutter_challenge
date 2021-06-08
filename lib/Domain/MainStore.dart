import 'package:flutter_challenge/Domain/HomeSpecialist.dart';
import 'Specialist.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
part 'MainStore.g.dart';

class MainStore = MainStoreBase with _$MainStore;

//Class to handle and store all registration actions and variables - using mobx
abstract class MainStoreBase with Store, ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  User? firebaseUser;

  @observable
  bool isLoginLoading = false;
  @observable
  bool isSpecialistLoading = false;

  @observable
  GlobalKey<ScaffoldState> loginScaffoldKey = GlobalKey<ScaffoldState>();
  @observable
  GlobalKey<ScaffoldState> goSpecialistScaffoldKey = GlobalKey<ScaffoldState>();

  @observable
  var selectedNeed = "Diagnostic";

  @observable
  var selectedSpecialist;

  @observable
  ObservableList<dynamic> homeSpecialists = ObservableList();
  @observable
  ObservableList<dynamic> specialists = ObservableList();
  @observable
  var specialist;

  @action
  Future getHome() async {
    isLoginLoading = true;
    var url =
        "https://raw.githubusercontent.com/vizodev/flutter_challenge/master/chalelnge_assets/api/home_specialists.json";

    final http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'connection': 'keep-alive',
        'Accept': "*/*",
      },
    );
    var parse = jsonDecode(response.body);
    for (int i = 0; i < 3; i++) {
      this.homeSpecialists.add(HomeSpecialist.fromJson(parse[i]));
    }
    isLoginLoading = false;
    return homeSpecialists;
  }

  @action
  Future getSpecialist(String _url, BuildContext context) async {
    isSpecialistLoading = true;
    final http.Response response = await http.get(
      Uri.parse(_url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'connection': 'keep-alive',
        'Accept': "*/*",
      },
    );
    var parse = jsonDecode(response.body);
    specialist = parse;

    for (int i = 0; i < specialist.length; i++) {
      this.specialists.add(Specialist.fromJson(specialist[i]));
    }
    isSpecialistLoading = false;
    return specialist;
  }

  @action
  Future<User?> signInAnonymously() async {
    isLoginLoading = true;
    await _auth.signInAnonymously().then((result) {
      firebaseUser = result.user;
      print(firebaseUser?.isAnonymous);
      print(firebaseUser?.uid);
    });
    isLoginLoading = false;
    return firebaseUser;
  }

  @action
  Future<bool> isAlreadyAuthenticated() async {
    isLoginLoading = true;

    firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      isLoginLoading = false;
      return true;
    } else {
      return false;
    }
  }
}
