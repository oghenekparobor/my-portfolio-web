import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/change-notifier/home_notifier.dart';
import 'package:provider/provider.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
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
              Text(
                'Hi! My name is Oghenekparobor and I am self taught mobile developer. I enjoy proffering solutions to challenges and building scalable products. I am proficient in Dart, Rust, PHP and JavaScript. Timely delivery and analytical thinking are my super powers. Let’s work together if you find me daring. ',
                textAlign: TextAlign.justify,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.abel(
                  color: Colors.white54,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
