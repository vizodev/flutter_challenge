import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/ChallengeColors.dart';
import 'package:flutter_challenge/Domain/MainStore.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../loader.dart';

class ExpertsList extends StatefulWidget {
  const ExpertsList({Key? key}) : super(key: key);

  @override
  _ExpertsListState createState() => _ExpertsListState();
}

class _ExpertsListState extends State<ExpertsList> {
  int tabIndex = 0;
  var chosentab;
  initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Consumer<MainStore>(builder: (_, mainStore, __) {
      return Observer(
          builder: (_) => LoaderHUD(
              key: mainStore.goSpecialistScaffoldKey,
              inAsyncCall: mainStore.isSpecialistLoading,
              child: Scaffold(
                bottomNavigationBar: buildBottomNavBar(),
                appBar: buildAppBar(mainStore),
                resizeToAvoidBottomInset: false,
                body: SafeArea(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          buildSpecialisTitle(mainStore),
                          buildNumberOfResults(mainStore),
                          buildDivider(),
                          buildDoctorsList(mainStore),
                        ],
                      ),
                    ),
                  ),
                ),
              )));
    });
  }

  buildAppBar(MainStore _mainStore) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              size: 20,
              color: Colors.black54,
            ),
            onPressed: () {},
          )
        ],
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            size: 20,
            color: Colors.black54,
          ),
          onPressed: () {
            _mainStore.specialists = new ObservableList<dynamic>();

            Navigator.pushReplacementNamed(context, "/home");
          },
        ));
  }

  Widget buildSpecialisTitle(MainStore _mainStore) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 50),
      child: Container(
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                _mainStore.selectedSpecialist.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))),
    );
  }

  Widget buildNumberOfResults(MainStore _mainStore) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 20),
      child: Container(
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            _mainStore.specialists.length != 0
                ? _mainStore.specialists.length.toString() +
                    " doctors were found"
                : "Seraching...",
            style: TextStyle(fontSize: 18, color: Color(0xff7c8494)),
          ),
        ),
      ),
    );
  }

  Widget buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
          child: Divider(
        thickness: 5,
        endIndent: 15,
        indent: 15,
      )),
    );
  }

  Widget buildDoctorsList(MainStore _mainStore) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: _mainStore.specialists.length,
        itemBuilder: (context, index) {
          return doctorCard(index, _mainStore);
        });
  }

  Widget doctorCard(int index, MainStore _mainStore) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 15),
                      child: Container(
                        color: _mainStore.specialists.length == 0
                            ? Color(0xff7c8494)
                            : Colors.transparent,
                        child: CircleAvatar(
                          radius: 30,
                          child: Text(
                            "?",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Container(
                        color: _mainStore.specialists.length == 0
                            ? Color(0xff7c8494)
                            : Colors.transparent,
                        child: Column(
                          children: [
                            Container(
                              width: 95,
                              child: Text(_mainStore.specialists[index].name,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                  "Nearby " +
                                      _mainStore.specialists[index].distance
                                          .toString() +
                                      " miles",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black45)),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 70.0, top: 10, right: 10),
                  child: Container(
                    color: _mainStore.specialists.length == 0
                        ? Color(0xff7c8494)
                        : Colors.transparent,
                    child: Text(
                      _mainStore.specialists[index].description.toString(),
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 65.0, right: 10, top: 30),
                        child: Container(
                          child: _mainStore.specialists[index].chat != null
                              ? ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              ChallengeColors.chatButton),
                                      shape: MaterialStateProperty.all<
                                              OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      50.0)))),
                                  onPressed: () {},
                                  child: Text(
                                    "Chat",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800),
                                  ),
                                )
                              : Container(),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 65, top: 30),
                        child: Container(
                          child: _mainStore.specialists[index].call != null
                              ? ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                              OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      50.0)))),
                                  onPressed: () {},
                                  child: Text(
                                    "Call",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800),
                                  ),
                                )
                              : Container(),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    child: Divider(
                      thickness: 2,
                      endIndent: 10,
                      indent: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
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
