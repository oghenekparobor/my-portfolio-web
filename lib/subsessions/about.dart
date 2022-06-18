import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_image/shimmer_image.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSubSection extends StatefulWidget {
  AboutSubSection({Key? key}) : super(key: key);

  @override
  _AboutSubSectionState createState() => _AboutSubSectionState();
}

class _AboutSubSectionState extends State<AboutSubSection>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();

    _animation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var portfolio = [
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1655568636/my-portfolio/Screenshot_2022-06-18_at_17.03.48_lyzhdg.png',
      'NAME': 'Chicken republic delta mall',
      'URL':
          'https://play.google.com/store/apps/details?id=com.chickenrepublicdeltamall',
    },
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1655568628/my-portfolio/Screenshot_2022-06-18_at_17.04.11_sz3ufy.png',
      'NAME': 'Cravings',
      'URL': 'https://cravingsng.com/',
    },
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1655568624/my-portfolio/Screenshot_2022-06-18_at_17.04.32_mro1pa.png',
      'NAME': 'Renmoney MFB',
      'URL':
          'https://play.google.com/store/apps/details?id=com.renmoney.android',
    },
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1655568637/my-portfolio/alerte_e6uwd5.jpg',
      'NAME': 'Alerte generic',
      'URL': 'https://play.google.com/store/apps/details?id=com.alerte.generic',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideTransition(
        position: _animation,
        child: ListView(
          children: [
            SizedBox(height: 100),
            for (var i = 0; i < portfolio.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () async => launchUrl(
                          Uri.parse(portfolio[i]['URL']!),
                        ),
                        child: Column(
                          children: [
                            Text(
                              portfolio[i]['NAME']!,
                              style: GoogleFonts.abel(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 400,
                              height: 400,
                              child: ProgressiveImage(
                                width: 400,
                                image: portfolio[i]['IMAGE']!,
                                height: 400,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
