import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/sessions/about.dart';
import 'package:myportfolio/sessions/contact.dart';
import 'package:myportfolio/sessions/home.dart';
import 'package:myportfolio/subsessions/about.dart';
import 'package:myportfolio/subsessions/contact.dart';
import 'package:myportfolio/subsessions/home.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
    _animation = Tween<Offset>(
      begin: const Offset(1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: SlideTransition(
              position: _animation,
              child: LeftMain(),
            ),
          ),
          Expanded(
            flex: 5,
            child: RightMain(),
          ),
        ],
      ),
    );
  }
}

class RightMain extends StatefulWidget {
  static final GlobalKey<RightMainState> globalKey =
      new GlobalKey<RightMainState>();
  RightMain() : super(key: RightMain.globalKey);

  @override
  RightMainState createState() => RightMainState();
}

class RightMainState extends State<RightMain> {
  PageController _controller;

  @override
  void initState() {
    _controller = new PageController();
    super.initState();
  }

  void gotoHome(BuildContext context) {
    _controller.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  void gotoAbout(BuildContext context) {
    _controller.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  void gotoContact(BuildContext context) {
    _controller.animateToPage(2,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: [
          HomeSubSection(),
          AboutSubSection(),
          ContactSubSection(),
        ],
      ),
    );
  }
}

class LeftMain extends StatefulWidget {
  LeftMain({
    Key key,
  }) : super(key: key);

  @override
  _LeftMainState createState() => _LeftMainState();
}

class _LeftMainState extends State<LeftMain> {
  PageController _controller;
  var _current = 0;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void gotoHome(BuildContext context) {
    _controller.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
    Future.delayed(Duration(milliseconds: 500))
        .then((value) => RightMain.globalKey.currentState.gotoHome(context));
    setState(() => _current = 0);
  }

  void gotoAbout(BuildContext context) {
    _controller.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
    Future.delayed(Duration(milliseconds: 500))
        .then((value) => RightMain.globalKey.currentState.gotoAbout(context));
    setState(() => _current = 1);
  }

  void gotoContact(BuildContext context) {
    _controller.animateToPage(2,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
    Future.delayed(Duration(milliseconds: 500))
        .then((value) => RightMain.globalKey.currentState.gotoContact(context));
    setState(() => _current = 2);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> nav = [
      {
        'title': 'Home',
        'function': () => gotoHome(context),
        'active': _current == 0 ? true : false,
      },
      {
        'title': 'About',
        'function': () => gotoAbout(context),
        'active': _current == 1 ? true : false,
      },
      {
        'title': 'Contact',
        'function': () => gotoContact(context),
        'active': _current == 2 ? true : false,
      }
    ];

    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: nav
                .map((e) => TextButton(
                      onPressed: e['function'],
                      child: Text(
                        e['title'],
                        style: GoogleFonts.abel(
                          color: e['active'] ? Colors.white : Colors.white38,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                HomeSection(),
                AboutSection(),
                ContactSection(),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Entypo.facebook,
                        color: Colors.white38,
                      ),
                      onPressed: () async =>
                          launch('https://web.facebook.com/robor.eminokanju'),
                    ),
                    IconButton(
                      icon: Icon(
                        Entypo.twitter,
                        color: Colors.white38,
                      ),
                      onPressed: () async =>
                          launch('https://twitter.com/kpa_robor'),
                    ),
                    IconButton(
                      icon: Icon(
                        Entypo.linkedin,
                        color: Colors.white38,
                      ),
                      onPressed: () async => launch(
                          'https://www.linkedin.com/in/oghenekparobor-eminokanju-ab9038180/'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
