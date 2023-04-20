import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/subsessions/widget/skill.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSubSection extends StatefulWidget {
  const HomeSubSection({Key? key}) : super(key: key);

  @override
  _HomeSubSectionState createState() => _HomeSubSectionState();
}

class _HomeSubSectionState extends State<HomeSubSection> {
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
            child: SlideInDown(
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Container(
                        color: Color.fromRGBO(47, 43, 49, 1),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Image.network(
                          'https://res.cloudinary.com/oghenekparobor/image/upload/v1682016171/my-portfolio/IMG_8742_cumwfz.jpg',
                          // 'https://res.cloudinary.com/oghenekparobor/image/upload/v1662622827/my-portfolio/my-portfolio_IMG_4306_agpm0q-q_20_lhrihk.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.maxFinite,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'About me',
                                      style: GoogleFonts.abel(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'A Flutter developer with 5+ year experience in mobile development. Timely delivery and analytical thinking are my superpowers.',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.abel(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () async => launchUrl(
                                  Uri.parse(
                                    'https://docs.google.com/document/d/1X0z5hf0YTtjTzhdRdQCLb6tNiukYp5O5V1sJb2jqh1U/edit?usp=sharing',
                                  ),
                                ),
                                child: Text(
                                  'Download Resume',
                                  style: GoogleFonts.abel(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xffD69976),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SlideInUp(
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Skills',
                              style: GoogleFonts.abel(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'I am proficient in',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.abel(),
                            ),
                            SizedBox(height: 30),
                            Expanded(child: SkillSet()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
