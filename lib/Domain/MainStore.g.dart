// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MainStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainStore on MainStoreBase, Store {
  final _$firebaseUserAtom = Atom(name: 'MainStoreBase.firebaseUser');

  @override
  User? get firebaseUser {
    _$firebaseUserAtom.reportRead();
    return super.firebaseUser;
  }

  @override
  set firebaseUser(User? value) {
    _$firebaseUserAtom.reportWrite(value, super.firebaseUser, () {
      super.firebaseUser = value;
    });
  }

  final _$isLoginLoadingAtom = Atom(name: 'MainStoreBase.isLoginLoading');

  @override
  bool get isLoginLoading {
    _$isLoginLoadingAtom.reportRead();
    return super.isLoginLoading;
  }

  @override
  set isLoginLoading(bool value) {
    _$isLoginLoadingAtom.reportWrite(value, super.isLoginLoading, () {
      super.isLoginLoading = value;
    });
  }

  final _$isSpecialistLoadingAtom =
      Atom(name: 'MainStoreBase.isSpecialistLoading');

  @override
  bool get isSpecialistLoading {
    _$isSpecialistLoadingAtom.reportRead();
    return super.isSpecialistLoading;
  }

  @override
  set isSpecialistLoading(bool value) {
    _$isSpecialistLoadingAtom.reportWrite(value, super.isSpecialistLoading, () {
      super.isSpecialistLoading = value;
    });
  }

  final _$loginScaffoldKeyAtom = Atom(name: 'MainStoreBase.loginScaffoldKey');

  @override
  GlobalKey<ScaffoldState> get loginScaffoldKey {
    _$loginScaffoldKeyAtom.reportRead();
    return super.loginScaffoldKey;
  }

  @override
  set loginScaffoldKey(GlobalKey<ScaffoldState> value) {
    _$loginScaffoldKeyAtom.reportWrite(value, super.loginScaffoldKey, () {
      super.loginScaffoldKey = value;
    });
  }

  final _$goSpecialistScaffoldKeyAtom =
      Atom(name: 'MainStoreBase.goSpecialistScaffoldKey');

  @override
  GlobalKey<ScaffoldState> get goSpecialistScaffoldKey {
    _$goSpecialistScaffoldKeyAtom.reportRead();
    return super.goSpecialistScaffoldKey;
  }

  @override
  set goSpecialistScaffoldKey(GlobalKey<ScaffoldState> value) {
    _$goSpecialistScaffoldKeyAtom
        .reportWrite(value, super.goSpecialistScaffoldKey, () {
      super.goSpecialistScaffoldKey = value;
    });
  }

  final _$selectedNeedAtom = Atom(name: 'MainStoreBase.selectedNeed');

  @override
  String get selectedNeed {
    _$selectedNeedAtom.reportRead();
    return super.selectedNeed;
  }

  @override
  set selectedNeed(String value) {
    _$selectedNeedAtom.reportWrite(value, super.selectedNeed, () {
      super.selectedNeed = value;
    });
  }

  final _$selectedSpecialistAtom =
      Atom(name: 'MainStoreBase.selectedSpecialist');

  @override
  dynamic get selectedSpecialist {
    _$selectedSpecialistAtom.reportRead();
    return super.selectedSpecialist;
  }

  @override
  set selectedSpecialist(dynamic value) {
    _$selectedSpecialistAtom.reportWrite(value, super.selectedSpecialist, () {
      super.selectedSpecialist = value;
    });
  }

  final _$homeSpecialistsAtom = Atom(name: 'MainStoreBase.homeSpecialists');

  @override
  ObservableList<dynamic> get homeSpecialists {
    _$homeSpecialistsAtom.reportRead();
    return super.homeSpecialists;
  }

  @override
  set homeSpecialists(ObservableList<dynamic> value) {
    _$homeSpecialistsAtom.reportWrite(value, super.homeSpecialists, () {
      super.homeSpecialists = value;
    });
  }

  final _$specialistsAtom = Atom(name: 'MainStoreBase.specialists');

  @override
  ObservableList<dynamic> get specialists {
    _$specialistsAtom.reportRead();
    return super.specialists;
  }

  @override
  set specialists(ObservableList<dynamic> value) {
    _$specialistsAtom.reportWrite(value, super.specialists, () {
      super.specialists = value;
    });
  }

  final _$specialistAtom = Atom(name: 'MainStoreBase.specialist');

  @override
  dynamic get specialist {
    _$specialistAtom.reportRead();
    return super.specialist;
  }

  @override
  set specialist(dynamic value) {
    _$specialistAtom.reportWrite(value, super.specialist, () {
      super.specialist = value;
    });
  }

  final _$getHomeAsyncAction = AsyncAction('MainStoreBase.getHome');

  @override
  Future<dynamic> getHome() {
    return _$getHomeAsyncAction.run(() => super.getHome());
  }

  final _$getSpecialistAsyncAction = AsyncAction('MainStoreBase.getSpecialist');

  @override
  Future<dynamic> getSpecialist(String _url, BuildContext context) {
    return _$getSpecialistAsyncAction
        .run(() => super.getSpecialist(_url, context));
  }

  final _$signInAnonymouslyAsyncAction =
      AsyncAction('MainStoreBase.signInAnonymously');

  @override
  Future<User?> signInAnonymously() {
    return _$signInAnonymouslyAsyncAction.run(() => super.signInAnonymously());
  }

  final _$isAlreadyAuthenticatedAsyncAction =
      AsyncAction('MainStoreBase.isAlreadyAuthenticated');

  @override
  Future<bool> isAlreadyAuthenticated() {
    return _$isAlreadyAuthenticatedAsyncAction
        .run(() => super.isAlreadyAuthenticated());
  }

  @override
  String toString() {
    return '''
firebaseUser: ${firebaseUser},
isLoginLoading: ${isLoginLoading},
isSpecialistLoading: ${isSpecialistLoading},
loginScaffoldKey: ${loginScaffoldKey},
goSpecialistScaffoldKey: ${goSpecialistScaffoldKey},
selectedNeed: ${selectedNeed},
selectedSpecialist: ${selectedSpecialist},
homeSpecialists: ${homeSpecialists},
specialists: ${specialists},
specialist: ${specialist}
    ''';
  }
}
