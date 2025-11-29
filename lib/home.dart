import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/change-notifier/home_notifier.dart';
import 'package:myportfolio/sessions/about.dart';
import 'package:myportfolio/sessions/contact.dart';
import 'package:myportfolio/sessions/hackathons.dart';
import 'package:myportfolio/sessions/home.dart';
import 'package:myportfolio/subsessions/about.dart';
import 'package:myportfolio/subsessions/contact.dart';
import 'package:myportfolio/subsessions/hackathons.dart';
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
            HackathonsSubSection(),
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
      backgroundColor: Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0A0A),
        elevation: 0,
        title: Consumer<HomeNotifier>(
          builder: (context, value, child) {
            var _nav = [
              'Home',
              'About',
              'Hackathons',
              'Contact',
            ];

            final isMobile = value.size(context) <= 500;
            
            if (isMobile) {
              // Mobile: Use bottom navigation or wrap in SingleChildScrollView
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (var i = 0; i < _nav.length; i++)
                      Container(
                        margin: EdgeInsets.only(right: 4),
                        child: TextButton(
                          onPressed: () => value.nav(i),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: i == value.currentPage
                                ? Color(0xffC59344).withOpacity(0.2)
                                : Colors.transparent,
                          ),
                          child: Text(
                            _nav[i],
                            style: GoogleFonts.abel(
                              color: i == value.currentPage
                                  ? Color(0xffC59344)
                                  : Colors.white70,
                              fontSize: 14,
                              fontWeight: i == value.currentPage
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }
            
            // Desktop: Original layout
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (var i = 0; i < _nav.length; i++)
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: TextButton(
                        onPressed: () => value.nav(i),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: i == value.currentPage
                              ? Color(0xffC59344).withOpacity(0.2)
                              : Colors.transparent,
                        ),
                        child: Text(
                          _nav[i],
                          style: GoogleFonts.abel(
                            color: i == value.currentPage
                                ? Color(0xffC59344)
                                : Colors.white70,
                            fontSize: 16,
                            fontWeight: i == value.currentPage
                                ? FontWeight.w600
                                : FontWeight.w400,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
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
                HackathonsSection(),
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
            mainAxisAlignment: value.size(context) <= 500
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              _SocialIconButton(
                icon: Entypo.twitter,
                onTap: () async =>
                    launchUrl(Uri.parse('https://x.com/oghenekparobor_')),
              ),
              _SocialIconButton(
                icon: FontAwesome5.telegram_plane,
                onTap: () async => launchUrl(
                  Uri.parse('https://t.me/oghenekparob_r'),
                ),
              ),
              _SocialIconButton(
                icon: Entypo.linkedin,
                onTap: () async => launchUrl(
                  Uri.parse(
                    'https://www.linkedin.com/in/aaron-eminokanju/',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _isHovered
              ? Color(0xffC59344).withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isHovered
                ? Color(0xffC59344).withOpacity(0.5)
                : Colors.transparent,
            width: 1,
          ),
        ),
        child: IconButton(
          icon: Icon(
            widget.icon,
            color: _isHovered ? Color(0xffC59344) : Colors.white60,
            size: 20,
          ),
          onPressed: widget.onTap,
        ),
      ),
    );
  }
}
