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
      backgroundColor: Color(0xFF0A0A0A),
      body: ElasticIn(
        delay: Duration(milliseconds: 300),
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width <= 500 ? 20.0 : 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Get in Touch',
                style: GoogleFonts.abel(
                  fontSize: MediaQuery.of(context).size.width <= 500 ? 28 : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'I am available and open to grab a coffee, consult and converse with.',
                style: GoogleFonts.abel(
                  fontSize: MediaQuery.of(context).size.width <= 500 ? 14 : 16,
                  color: Colors.white60,
                  height: 1.5,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width <= 500 ? 30 : 50),
              _ContactCard(
                label: 'PHONE',
                value: '+2349060257738',
                icon: Icons.phone,
                onTap: () => launchUrl(Uri.parse('tel:+2349060257738')),
              ),
              SizedBox(height: MediaQuery.of(context).size.width <= 500 ? 20 : 30),
              _ContactCard(
                label: 'EMAIL',
                value: 'robor.eminokanju@gmail.com',
                icon: Icons.email,
                onTap: () => launchUrl(
                  Uri.parse('mailto:robor.eminokanju@gmail.com'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  const _ContactCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(MediaQuery.of(context).size.width <= 500 ? 20 : 30),
          decoration: BoxDecoration(
            color: Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered
                  ? Color(0xffC59344).withOpacity(0.5)
                  : Colors.transparent,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? Color(0xffC59344).withOpacity(0.2)
                    : Colors.black.withOpacity(0.3),
                blurRadius: _isHovered ? 20 : 10,
                offset: Offset(0, _isHovered ? 10 : 5),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xffC59344).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  widget.icon,
                  color: Color(0xffC59344),
                  size: 28,
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: GoogleFonts.abel(
                        fontSize: 14,
                        color: Colors.white60,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.value,
                      style: GoogleFonts.abel(
                        fontSize: MediaQuery.of(context).size.width <= 500 ? 18 : 24,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: _isHovered ? Color(0xffC59344) : Colors.white30,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
