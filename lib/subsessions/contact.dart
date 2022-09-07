import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSubSection extends StatefulWidget {
  const ContactSubSection({Key? key}) : super(key: key);

  @override
  _ContactSubSectionState createState() => _ContactSubSectionState();
}

class _ContactSubSectionState extends State<ContactSubSection> {
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
      body: ElasticIn(
        delay: Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'PHONE',
                style: GoogleFonts.abel(fontSize: 15),
              ),
              GestureDetector(
                onTap: () => launchUrl(
                  Uri.parse('tel:+2349060257738'),
                ),
                child: Text(
                  '+2349060257738',
                  style: GoogleFonts.abel(
                    fontSize: 40,
                    letterSpacing: 5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: GoogleFonts.abel(fontSize: 15),
              ),
              GestureDetector(
                onTap: () => launchUrl(
                  Uri.parse('mailto:robor.eminokanju@gmail.com'),
                ),
                child: Text(
                  'ROBOR.EMINOKANJU@GMAIL.COM',
                  style: GoogleFonts.abel(
                    fontSize: 40,
                    letterSpacing: 5,
                    fontWeight: FontWeight.bold,
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
