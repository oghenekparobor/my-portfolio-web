import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSubSection extends StatefulWidget {
  AboutSubSection({Key key}) : super(key: key);

  @override
  _AboutSubSectionState createState() => _AboutSubSectionState();
}

class _AboutSubSectionState extends State<AboutSubSection>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _animation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var portfolio = [
    {
      'IMAGE': 'assets/images/naijafood.jpg',
      'NAME': '',
      'URL': 'https://naija-foods.com/',
    },
    {
      'IMAGE': 'assets/images/bella.jpg',
      'NAME': '',
      'URL': 'https://b-grills.com/',
    },
    {
      'IMAGE': 'assets/images/restaurant.png',
      'NAME': '',
      'URL': '',
    },
    {
      'IMAGE': 'assets/images/askie.jpg',
      'NAME': '',
      'URL': '',
    },
    {
      'IMAGE': 'assets/images/alerte.jpg',
      'NAME': '',
      'URL': 'https://alertegeneric.com/',
    },
    {
      'IMAGE': 'assets/images/edge.jpg',
      'NAME': '',
      'URL': '',
    },
    {
      'IMAGE': 'assets/images/paradise.jpg',
      'NAME': '',
      'URL': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideTransition(
        position: _animation,
        child: ListView(
          children: [
            SizedBox(height: 150),
            for (var i = 0; i < portfolio.length; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () async => launch(portfolio[i]['URL']),
                      child: Column(
                        children: [
                          Text(
                            portfolio[i]['NAME'],
                            style: GoogleFonts.abel(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 400,
                            height: 400,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(portfolio[i]['IMAGE']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            // margin: EdgeInsets.all(15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
