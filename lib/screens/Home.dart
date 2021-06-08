import 'package:flutter/material.dart';
import 'package:flutter_challenge/ChallengeColors.dart';
import 'package:flutter_challenge/Domain/MainStore.dart';
import 'package:flutter_challenge/loader.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  MainStore _mainStore = new MainStore();
  int tabIndex = 0;
  var chosentab;
  initState() {
    super.initState();
    try {
      getHome();
    } catch (e) {
      print("error");
      getHome();
    }
  }

  void getHome() {
    _mainStore.getHome();
  }

  Widget build(BuildContext context) {
    return Consumer<MainStore>(builder: (_, mainStore, __) {
      Provider.of<MainStore>(context, listen: true)
          .isAlreadyAuthenticated()
          .then((result) {
        if (!result) {
          mainStore.signInAnonymously();
        }
      });
      return Observer(
          builder: (_) => LoaderHUD(
                key: mainStore.loginScaffoldKey,
                inAsyncCall: mainStore.isLoginLoading,
                child: Scaffold(
                    key: _scaffoldKey,
                    resizeToAvoidBottomInset: false,
                    body: SafeArea(
                      child: SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: _mainStore.homeSpecialists.length > 0
                              ? Column(
                                  children: [
                                    buildHello(),
                                    buildName(),
                                    buildSpecialistsTitle(),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Row(children: [
                                        buildHeartSpecialist(mainStore),
                                        buildDentalSpecialist(mainStore),
                                        buildDarmatologSpecialist(mainStore),
                                      ]),
                                    ),
                                    buildNeedsTitle(),
                                    buildNeedsGrid(mainStore)
                                  ],
                                )
                              : Container(),
                        ),
                      ),
                    ),
                    bottomNavigationBar: buildBottomNavBar()),
              ));
    });
  }

  Widget buildHello() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 25),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Text(
              'Hello,',
              style: TextStyle(
                  color: Colors.black38, fontFamily: 'Segoe UI', fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildName() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Lorelle Luna",
          style: TextStyle(
              color: Colors.black,
              fontSize: 34,
              fontFamily: 'Segoe UI',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildSpecialistsTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 35),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Specialists",
          style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontFamily: 'SegoeUI',
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget buildHeartSpecialist(MainStore mainStore) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: GestureDetector(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
                color: ChallengeColors.heartSpecialist,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2 * 0.25,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0, left: 12),
                      child: SvgPicture.network(
                        _mainStore.homeSpecialists.elementAt(0).image_url,
                        width: 24,
                        height: 24,
                        color: ChallengeColors.heartSpecialist,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10),
                  child: Text(
                    _mainStore.homeSpecialists
                        .elementAt(0)
                        ?.name
                        ?.split(' ')[0],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 10),
                  child: Text(
                    _mainStore.homeSpecialists[0].name.toString().split(' ')[1],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10),
                  child: Text(
                    "${_mainStore.homeSpecialists[0].total}  Doctors",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            setState(() {
              mainStore.selectedSpecialist =
                  _mainStore.homeSpecialists.elementAt(0);
            });
            var tempSpecialist;
            mainStore
                .getSpecialist(
                    "https://raw.githubusercontent.com/vizodev/flutter_challenge/master/chalelnge_assets/api/list_specialist_heart.json",
                    context)
                .then((value) => {
                      tempSpecialist = value,
                      Future.delayed(Duration(seconds: 1), () {
                        mainStore.specialist = tempSpecialist;
                      }),
                      Navigator.pushReplacementNamed(
                        context,
                        "/expertsList",
                      )
                    });
          },
        ),
      ),
    );
  }

  Widget buildDentalSpecialist(MainStore mainStore) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 5),
        child: GestureDetector(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
                color: ChallengeColors.dentalCare,
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2 * 0.25,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0, left: 12),
                      child: SvgPicture.network(
                        _mainStore.homeSpecialists.elementAt(1).image_url,
                        width: 24,
                        height: 24,
                        color: ChallengeColors.dentalCare,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10),
                  child: Text(
                    _mainStore.homeSpecialists[1].name.toString().split(' ')[0],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 10),
                  child: Text(
                    _mainStore.homeSpecialists[1].name.toString().split(' ')[1],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10),
                  child: Text(
                    "${_mainStore.homeSpecialists[1].total}  Doctors",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            setState(() {
              mainStore.selectedSpecialist =
                  _mainStore.homeSpecialists.elementAt(1);
            });
            var tempSpecialist;
            mainStore
                .getSpecialist(
                    "https://raw.githubusercontent.com/vizodev/flutter_challenge/master/chalelnge_assets/api/list_specialist_dental_care.json",
                    context)
                .then((value) => {
                      tempSpecialist = value,
                      Future.delayed(Duration(seconds: 1), () {
                        mainStore.specialist = tempSpecialist;
                      }),
                      Navigator.pushReplacementNamed(
                        context,
                        "/expertsList",
                      )
                    });
          },
        ),
      ),
    );
  }

  Widget buildDarmatologSpecialist(MainStore mainStore) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 10),
        child: GestureDetector(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
                color: ChallengeColors.chatButton,
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2 * 0.25,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0, left: 12),
                      child: SvgPicture.network(
                        _mainStore.homeSpecialists.elementAt(2).image_url,
                        width: 24,
                        height: 24,
                        color: ChallengeColors.whatDoYouNeedSelection,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10),
                  child: Text(
                    _mainStore.homeSpecialists[2].name.toString().split(' ')[0],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 10),
                  child: Text(
                    _mainStore.homeSpecialists[2].name.toString().split(' ')[1],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10),
                  child: Text(
                    "${_mainStore.homeSpecialists[2].total} Doctors",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            setState(() {
              mainStore.selectedSpecialist =
                  _mainStore.homeSpecialists.elementAt(2);
            });
            var tempSpecialist;
            mainStore
                .getSpecialist(
                    "https://raw.githubusercontent.com/vizodev/flutter_challenge/master/chalelnge_assets/api/list_specialist_dermatology.json",
                    context)
                .then((value) => {
                      tempSpecialist = value,
                      Future.delayed(Duration(seconds: 1), () {
                        mainStore.specialist = tempSpecialist;
                      }),
                      Navigator.pushReplacementNamed(
                        context,
                        "/expertsList",
                      )
                    });
          },
        ),
      ),
    );
  }

  Widget buildNeedsTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 30),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "What do you need ?",
          style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'SegoeUI',
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget buildNeedsGrid(MainStore mainStore) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.only(left: 20, right: 30, top: 20, bottom: 35),
      crossAxisSpacing: 10,
      shrinkWrap: true,
      mainAxisSpacing: 20,
      crossAxisCount: 3,
      children: <Widget>[
        GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: mainStore.selectedNeed == "Diagnostic"
                      ? ChallengeColors.whatDoYouNeedSelection
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: Offset(0.0, 1.0),
                      blurRadius: 2.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/stethoscope.svg',
                    width: 30,
                    height: 30,
                    color: mainStore.selectedNeed == "Diagnostic"
                        ? Colors.white
                        : Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Diagnostic",
                      style: TextStyle(
                          color: mainStore.selectedNeed == "Diagnostic"
                              ? Colors.white
                              : Colors.black),
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              setState(() {
                mainStore.selectedNeed = "Diagnostic";
              });
            }),
        GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: mainStore.selectedNeed == "Consulation"
                      ? ChallengeColors.whatDoYouNeedSelection
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: Offset(0.0, 1.0),
                      blurRadius: 2.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/patient.svg',
                    width: 30,
                    height: 30,
                    color: mainStore.selectedNeed == "Consulation"
                        ? Colors.white
                        : Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("Consulation",
                        style: TextStyle(
                            color: mainStore.selectedNeed == "Consulation"
                                ? Colors.white
                                : Colors.black)),
                  )
                ],
              ),
            ),
            onTap: () {
              setState(() {
                mainStore.selectedNeed = "Consulation";
              });
            }),
        GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: mainStore.selectedNeed == "Nurse"
                      ? ChallengeColors.whatDoYouNeedSelection
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: Offset(0.0, 1.0),
                      blurRadius: 2.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/nurse.svg',
                    width: 30,
                    height: 30,
                    color: mainStore.selectedNeed == "Nurse"
                        ? Colors.white
                        : Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("Nurse",
                        style: TextStyle(
                            color: mainStore.selectedNeed == "Nurse"
                                ? Colors.white
                                : Colors.black)),
                  )
                ],
              ),
            ),
            onTap: () {
              setState(() {
                mainStore.selectedNeed = "Nurse";
              });
            }),
        GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: mainStore.selectedNeed == "Ambulance"
                      ? ChallengeColors.whatDoYouNeedSelection
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: Offset(0.0, 1.0),
                      blurRadius: 2.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ambulance.svg',
                    width: 30,
                    height: 30,
                    color: mainStore.selectedNeed == "Ambulance"
                        ? Colors.white
                        : Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("Ambulance",
                        style: TextStyle(
                            color: mainStore.selectedNeed == "Ambulance"
                                ? Colors.white
                                : Colors.black)),
                  )
                ],
              ),
            ),
            onTap: () {
              setState(() {
                mainStore.selectedNeed = "Ambulance";
              });
            }),
        GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: mainStore.selectedNeed == "Lab"
                      ? ChallengeColors.whatDoYouNeedSelection
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: Offset(0.0, 1.0),
                      blurRadius: 2.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/flask.svg',
                    width: 30,
                    height: 30,
                    color: mainStore.selectedNeed == "Lab"
                        ? Colors.white
                        : Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("Lab Work",
                        style: TextStyle(
                            color: mainStore.selectedNeed == "Lab"
                                ? Colors.white
                                : Colors.black)),
                  )
                ],
              ),
            ),
            onTap: () {
              setState(() {
                mainStore.selectedNeed = "Lab";
              });
            }),
        GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: mainStore.selectedNeed == "Medicine"
                      ? ChallengeColors.whatDoYouNeedSelection
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: Offset(0.0, 1.0),
                      blurRadius: 2.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/medicine.svg',
                    width: 30,
                    height: 30,
                    color: mainStore.selectedNeed == "Medicine"
                        ? Colors.white
                        : Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("Medicine",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: mainStore.selectedNeed == "Medicine"
                                ? Colors.white
                                : Colors.black)),
                  )
                ],
              ),
            ),
            onTap: () {
              setState(() {
                mainStore.selectedNeed = "Medicine";
              });
            }),
      ],
    );
  }

  Widget buildBottomNavBar() {
    return BottomNavigationBar(
      selectedLabelStyle: TextStyle(color: Colors.purple),
      selectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
      currentIndex: tabIndex,
      selectedItemColor: ChallengeColors.chatButton,
      showSelectedLabels: true,
      unselectedItemColor: Color(0xff7c8494),
      unselectedLabelStyle: TextStyle(color: Colors.white),
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: "More",
        ),
      ],
      onTap: (index) {
        setState(() {
          tabIndex = index;
        });
        if (tabIndex == 1) {
          chosentab = "Home";
        } else if (tabIndex == 2) {
          chosentab = "Chat";
        } else if (tabIndex == 3) {
          chosentab = "Notification";
        } else {
          chosentab = "More";
        }
      },
    );
  }
}
