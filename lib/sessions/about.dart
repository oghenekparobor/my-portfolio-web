import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/change-notifier/home_notifier.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Image.network(
              'https://res.cloudinary.com/oghenekparobor/image/upload/v1747916987/Guava/yp3wl395eurngrudllds.jpg',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black87.withOpacity(.8),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // if ((value.size(context) > 500))
                  Text(
                    'About Me',
                    style: GoogleFonts.abel(
                      color: Colors.white,
                      fontSize: (value.size(context) > 500) ? 72 : 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: (value.size(context) > 500) ? 10 : 2,
                    ),
                  ),
                  if ((value.size(context) > 500)) SizedBox(height: 15),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: '''Building ''',
                      ),
                      TextSpan(
                        text: '''@guavafinance.''',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async => await launchUrl(
                                Uri.parse('https://x.com/guavafinance'),
                              ),
                        style: GoogleFonts.abel(
                          color: Color(0xffC59344),
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                      ),
                      TextSpan(
                        text:
                            '''| I’m an introvert trying to do work that matters. I care about leaving a mark, even if it means pushing past my quiet nature. I’ve dabbled in a lot, code, ideas, projects, and it’s made me a better thinker. I tend to look at a product or problem and see a path to the finish. \n\nI watch anime (2 of the big 3 and counting), read when I can, and music keeps me grounded. I like learning, not just because it’s useful, but because it keeps me curious. Still figuring things out, but I show up every day and try to get better.''',
                      ),
                    ]),
                    textAlign: TextAlign.justify,
                    maxLines: 12,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.abel(
                      color: Colors.white54,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
