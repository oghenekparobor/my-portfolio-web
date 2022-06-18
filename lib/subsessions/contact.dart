import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSubSection extends StatefulWidget {
  const ContactSubSection({Key? key}) : super(key: key);

  @override
  _ContactSubSectionState createState() => _ContactSubSectionState();
}

class _ContactSubSectionState extends State<ContactSubSection>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

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
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideTransition(
        position: _animation,
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
                  '09060257738',
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
