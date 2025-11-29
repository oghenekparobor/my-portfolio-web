import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HackathonsSubSection extends StatefulWidget {
  const HackathonsSubSection({Key? key}) : super(key: key);

  @override
  _HackathonsSubSectionState createState() => _HackathonsSubSectionState();
}

class _HackathonsSubSectionState extends State<HackathonsSubSection> {
  var hackathons = [
    {
      'NAME': 'Colosseum Breakout',
      'DATE': 'April 2025 - May 2025',
      'DESCRIPTION': 'Self custody wallet for users to spend crypto like cash.',
      'TECH_STACK': 'Rust, Solana, Flutter',
      'AWARD': 'Participant',
      'LINK':
          'https://arena.colosseum.org/projects/explore/guava?previous=L3Byb2plY3RzL2V4cGxvcmU_c2VlZD1lNzM3NDE0NzAyNTM1OGZiJnNlYXJjaD1ndWF2YSZoYWNrYXRob25JZD00',
      'IMAGE': 'https://guava.finance/assets/logo.svg',
    },
    {
      'NAME': 'Colosseum Cypherpunk',
      'DATE': 'September 2025 - October 2025',
      'DESCRIPTION':
          'Offline-first solana mesh network enabling transactions without internet.',
      'TECH_STACK': 'Rust, Kotlin, Solana',
      'AWARD': 'Participant',
      'LINK':
          'https://arena.colosseum.org/projects/explore/pollinet?previous=L3Byb2plY3RzL2V4cGxvcmU_c2VlZD1lNzM3NDE0NzAyNTM1OGZiJnNlYXJjaD1wb2xsaW5ldA',
      'IMAGE': 'https://pollinet.xyz/pollinet.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0A0A),
      body: SlideInUp(
        child: ListView(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width <= 500 ? 12 : 20),
          children: [
            for (var i = 0; i < hackathons.length; i++) ...{
              _HackathonCard(
                name: hackathons[i]['NAME']!,
                date: hackathons[i]['DATE']!,
                description: hackathons[i]['DESCRIPTION']!,
                techStack: hackathons[i]['TECH_STACK']!,
                award: hackathons[i]['AWARD']!,
                link: hackathons[i]['LINK']!,
                image: hackathons[i]['IMAGE']!,
                index: i,
              ),
            },
          ],
        ),
      ),
    );
  }
}

class _HackathonCard extends StatefulWidget {
  final String name;
  final String date;
  final String description;
  final String techStack;
  final String award;
  final String link;
  final String image;
  final int index;

  const _HackathonCard({
    required this.name,
    required this.date,
    required this.description,
    required this.techStack,
    required this.award,
    required this.link,
    required this.image,
    required this.index,
  });

  @override
  State<_HackathonCard> createState() => _HackathonCardState();
}

class _HackathonCardState extends State<_HackathonCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async => launchUrl(Uri.parse(widget.link)),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width <= 500 ? 20 : 30),
          decoration: BoxDecoration(
            color: Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? Color(0xffC59344).withOpacity(0.3)
                    : Colors.black.withOpacity(0.3),
                blurRadius: _isHovered ? 30 : 20,
                offset: Offset(0, _isHovered ? 15 : 10),
              ),
            ],
            border: Border.all(
              color: _isHovered
                  ? Color(0xffC59344).withOpacity(0.5)
                  : Colors.transparent,
              width: 1,
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 600;
              
              Widget imageWidget = Container(
                margin: EdgeInsets.all(isMobile ? 16 : 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: AnimatedScale(
                    scale: _isHovered ? 1.05 : 1.0,
                    duration: Duration(milliseconds: 300),
                    child: widget.image.toLowerCase().endsWith('.svg')
                        ? SvgPicture.network(
                            widget.image,
                            fit: BoxFit.cover,
                            placeholderBuilder: (context) => Container(
                              color: Color(0xFF2A2A2A),
                              child: Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xffC59344),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Image.network(
                            widget.image,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Color(0xFF2A2A2A),
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: Colors.white38,
                                  size: 48,
                                ),
                              );
                            },
                          ),
                  ),
                ),
              );
              
              Widget contentWidget = Padding(
                padding: EdgeInsets.all(isMobile ? 16 : 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.name,
                            style: GoogleFonts.abel(
                              fontSize: isMobile ? 22 : 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffC59344).withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xffC59344).withValues(alpha: 0.5),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            widget.award,
                            style: GoogleFonts.abel(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffC59344),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.date,
                      style: GoogleFonts.abel(
                        fontSize: 14,
                        color: Colors.white60,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      widget.description,
                      style: GoogleFonts.abel(
                        fontSize: isMobile ? 14 : 15,
                        color: Colors.white70,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.code,
                          size: 16,
                          color: Color(0xffC59344),
                        ),
                        SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            widget.techStack,
                            style: GoogleFonts.abel(
                              fontSize: 14,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color:
                              _isHovered ? Color(0xffC59344) : Colors.white30,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'View Project',
                          style: GoogleFonts.abel(
                            fontSize: 14,
                            color: _isHovered
                                ? Color(0xffC59344)
                                : Colors.white60,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
              
              if (isMobile) {
                // Mobile: Vertical layout
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      child: imageWidget,
                    ),
                    contentWidget,
                  ],
                );
              } else {
                // Desktop: Horizontal layout
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 200,
                      child: imageWidget,
                    ),
                    Expanded(child: contentWidget),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
