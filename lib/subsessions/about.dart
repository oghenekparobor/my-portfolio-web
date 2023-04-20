import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_image/shimmer_image.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSubSection extends StatefulWidget {
  AboutSubSection({Key? key}) : super(key: key);

  @override
  _AboutSubSectionState createState() => _AboutSubSectionState();
}

class _AboutSubSectionState extends State<AboutSubSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var portfolio = [
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1662626024/my-portfolio/Screenshot_2022-06-18_at_17.04.32_mro1pa_gwahag.png',
      'NAME': 'Renmoney MFB',
      'URL':
          'https://play.google.com/store/apps/details?id=com.renmoney.android',
    },
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1682016362/my-portfolio/Screenshot_56_iv3nfa.png',
      'NAME': 'Tafipal',
      'URL': 'https://play.google.com/store/apps/details?id=com.tafipal.app',
    },
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1662626959/my-portfolio/Screenshot_2022-06-18_at_17.04.11_sz3ufy_cek8l2.png',
      'NAME': 'Cravings',
      'URL': 'https://cravingsng.com/',
    },
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1655568637/my-portfolio/alerte_e6uwd5.jpg',
      'NAME': 'Alerte generic',
      'URL': 'https://play.google.com/store/apps/details?id=com.alerte.generic',
    },
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1666136234/my-portfolio/unnamed_b3iz54.webp',
      'NAME': 'Detailor',
      'URL': 'https://play.google.com/store/apps/details?id=detailor.online',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideInUp(
        child: ListView(
          children: [
            SizedBox(height: 100),
            for (var i = 0; i < portfolio.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 45),
                child: GestureDetector(
                  onTap: () async => launchUrl(
                    Uri.parse(portfolio[i]['URL']!),
                  ),
                  child: Column(
                    children: [
                      Text(
                        portfolio[i]['NAME']!,
                        style: GoogleFonts.abel(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 550,
                        height: 600,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/placeholder.png',
                          image: portfolio[i]['IMAGE']!,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 20),
                      Divider(),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
