/// Main coder: Uyen
/// Small modification: Chi
// NAVIGATION BAR MAIN
import 'package:flutter/material.dart';
import 'theme.dart';

//Switched the original widget to PreferredSizeWidget so it can be used as appBar (Chi)
class Bar extends StatelessWidget implements PreferredSizeWidget {
  Bar({
    Key? key,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize; // default is 56.0
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NaviBar(),
    );
  }
}

class NaviBar extends StatefulWidget {
  const NaviBar({
    Key? key,
  }) : super(key: key);

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      //child 1: navigation bar
      Container(
          padding: const EdgeInsets.all(3.0),
          color: Colors.white,
          child: Row(children: [
            // child 1: HAMBURGER BUTTON
            IconButton(
                onPressed: () {
                  //do something when hamburger bar is pressed on
                },
                icon: Image.asset('images/icon/hamburger-button.png')),
            SizedBox(width: 30.0),
            // CHILD 2: LOGO
            Container(child: Image.asset('images/icon/Logo.png')),
            SizedBox(width: 60.0),
            // CHILD 3: SEARCH BOX
            Flexible(
                child: TextField(
                    style: TextStyle(fontSize: 16.0),
                    //controller: _searchText,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(
                                color: Color.fromRGBO(0, 25, 110, 1),
                                width: 2.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(
                                color: Color.fromRGBO(0, 25, 110, 1),
                                width: 2.0)),
                        hintText: 'Search for content by keywords here...',
                        suffixIcon: Image.asset('images/icon/search_icon.png'),
                        fillColor: Colors.white,
                        filled: true))),
            SizedBox(width: 40.0),
            // CHILD 4: PROFILE PIC
            Container(child: Image.asset('images/pfp/profilepic.png'))
          ]))
    ]));
  }
}
