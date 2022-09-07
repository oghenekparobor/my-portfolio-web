import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/change-notifier/home_notifier.dart';
import 'package:myportfolio/sessions/about.dart';
import 'package:myportfolio/sessions/contact.dart';
import 'package:myportfolio/sessions/home.dart';
import 'package:myportfolio/subsessions/about.dart';
import 'package:myportfolio/subsessions/contact.dart';
import 'package:myportfolio/subsessions/home.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<DesktopHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: SlideInRight(
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
  RightMain({Key? key}) : super(key: key);

  @override
  RightMainState createState() => RightMainState();
}

class RightMainState extends State<RightMain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeNotifier>(
        builder: (context, value, child) => PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: value.rightPage,
          scrollDirection: Axis.vertical,
          children: [
            HomeSubSection(),
            AboutSubSection(),
            ContactSubSection(),
          ],
        ),
      ),
    );
  }
}

class LeftMain extends StatefulWidget {
  LeftMain({
    Key? key,
  }) : super(key: key);

  @override
  LeftMainState createState() => LeftMainState();
}

class LeftMainState extends State<LeftMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Consumer<HomeNotifier>(
          builder: (context, value, child) {
            var _nav = [
              'Home',
              'About',
              'Contact',
            ];

            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (var i = 0; i < _nav.length; i++)
                  TextButton(
                    onPressed: () => value.nav(i),
                    child: Text(
                      _nav[i],
                      style: GoogleFonts.abel(
                        color: i == value.currentPage
                            ? Colors.white
                            : Colors.white38,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      body: Consumer<HomeNotifier>(
        builder: (context, value, child) => Stack(
          children: [
            PageView(
              controller: value.leftPage,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                HomeSection(),
                AboutSection(),
                ContactSection(),
              ],
            ),
            if (value.size(context) > 500) FooterLinks()
          ],
        ),
      ),
    );
  }
}

class FooterLinks extends StatelessWidget {
  const FooterLinks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, value, child) => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: value.size(context) < 500
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  Entypo.twitter,
                  color: Colors.white38,
                ),
                onPressed: () async =>
                    launchUrl(Uri.parse('https://twitter.com/kpa_robor')),
              ),
              IconButton(
                icon: Icon(
                  Entypo.linkedin,
                  color: Colors.white38,
                ),
                onPressed: () async => launchUrl(Uri.parse(
                    'https://www.linkedin.com/in/oghenekparobor-eminokanju-ab9038180/')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
