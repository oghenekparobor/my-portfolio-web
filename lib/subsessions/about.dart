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
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1747918758/Guava/wd5nzo87znds8mw7sesf.png',
      'NAME': 'Guava Finance',
      'URL': 'https://guava.finance',
    },
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1747919091/Guava/nb6pxyrjo8zciinw5v6y.png',
      'NAME': 'Excrow',
      'URL': 'https://excrow.co',
    },
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1747919205/Guava/qn9ekcuh5gzr5ofyxabn.png',
      'NAME': 'Renmoney MFB',
      'URL':
          'https://play.google.com/store/apps/details?id=com.renmoney.android',
    },
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1747934355/Guava/kfkupn4bov6bav2sp7z2.png',
      'NAME': 'Trigger - End of Life Service',
      'URL':
          'https://apps.apple.com/ng/app/trigger-end-of-life-service/id6448679624',
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
                    mainAxisSize: MainAxisSize.min,
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
