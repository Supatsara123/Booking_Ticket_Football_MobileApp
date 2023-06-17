import 'package:buyticketfootball/auth/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;
  const BottomTabs(
      {Key? key, required this.selectedTab, required this.tabPressed})
      : super(key: key);

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedTabs = 0;

  @override
  Widget build(BuildContext context) {
    _selectedTabs = widget.selectedTab;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 1.0,
              blurRadius: 30.0,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomTabsBtn(
            imagePath: "assets/icons/tab_home.png",
            selected: _selectedTabs == 0 ? true : false,
            onPressed: () {
              widget.tabPressed(0);
            },
          ),
          BottomTabsBtn(
            imagePath: "assets/icons/tab_cart.png",
            selected: _selectedTabs == 1 ? true : false,
            onPressed: () {
              widget.tabPressed(1);
            },
          ),
          BottomTabsBtn(
            imagePath: "assets/icons/tab_logout.png",
            selected: _selectedTabs == 2 ? true : false,
            onPressed: () async {
              //widget.tabPressed(2);
              debugPrint("before logout return to main page");
              await FirebaseAuth.instance.signOut();
              //redirect to login page
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(
                    builder: (BuildContext context)=>  MainPage(),
                  ),
                  (route) => false,
              );

            },
          ),
        ],
      ),
    );
  }
}

class BottomTabsBtn extends StatelessWidget {
  final String imagePath;
  final bool selected;
  final VoidCallback onPressed;
  const BottomTabsBtn({
    Key? key,
    required this.imagePath,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = selected;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
          margin: const EdgeInsets.only(bottom: 25),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: isSelected
                          ? const Color(0xffd7536d)
                          : Colors.transparent,
                      width: 3.0))),
          width: 30.0,
          height: 40.0,
          child: Image(
            image: AssetImage(imagePath),
            color:
            isSelected ? const Color(0xffd7536d) : const Color(0xff9babc5),
          )),
    );
  }
}