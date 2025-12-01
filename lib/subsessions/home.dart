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

  Widget _buildProfileSectionMobile() {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width <= 500;

    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image section - fixed height
            Container(
              height: isMobile ? 400 : 250,
              width: double.infinity,
              color: Color.fromRGBO(47, 43, 49, 1),
              child: Image.network(
                'https://res.cloudinary.com/oghenekparobor/image/upload/v1764571997/6FEB7A5B-52D5-47E1-99DD-EDC2B3B78B50_4_miu2da.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: isMobile ? 400 : 250,
              ),
            ),
            // Content section - no Expanded
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF1A1A1A),
                    Color(0xFF0A0A0A),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'About me',
                      style: GoogleFonts.abel(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Senior mobile engineer and Rust developer specializing in Solana blockchain. School of Solana graduate building next-gen web3 payment and consumer applications. I craft high-performance mobile apps with Flutter and develop smart contracts in Rust, bridging the gap between traditional fintech and decentralized innovation. When I\'m not coding, you\'ll find me deep in anime — proud Otaku.',
                      style: GoogleFonts.abel(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white70,
                        height: 1.6,
                      ),
                      maxLines: isMobile ? 4 : null,
                      overflow: isMobile ? TextOverflow.ellipsis : null,
                    ),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffC59344),
                            Color(0xffD69976),
                          ],
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async => launchUrl(
                            Uri.parse(
                              'https://drive.google.com/file/d/13d-ZA4O1OCOLXIBhdNpazVXd9pB-TceY/view?usp=sharing',
                            ),
                          ),
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            child: Text(
                              'Download Resume',
                              style: GoogleFonts.abel(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white,
                                letterSpacing: 1,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSectionDesktop() {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                color: Color.fromRGBO(47, 43, 49, 1),
                child: Image.network(
                  'https://res.cloudinary.com/oghenekparobor/image/upload/v1747910064/Guava/fi90esm5eajp1mq4sdjh.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF1A1A1A),
                      Color(0xFF0A0A0A),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'About me',
                        style: GoogleFonts.abel(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 12),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            'Senior mobile engineer and Rust developer specializing in Solana blockchain. School of Solana graduate building next-gen web3 payment and consumer applications. I craft high-performance mobile apps with Flutter and develop smart contracts in Rust, bridging the gap between traditional fintech and decentralized innovation. When I\'m not coding, you\'ll find me deep in anime — proud Otaku.',
                            style: GoogleFonts.abel(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.white70,
                              height: 1.6,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffC59344),
                              Color(0xffD69976),
                            ],
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async => launchUrl(
                              Uri.parse(
                                'https://drive.google.com/file/d/1kuwbO0MhFJ-kwqdUTvMIYiZm4-T7KOj8/view?usp=sharing',
                              ),
                            ),
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              child: Text(
                                'Download Resume',
                                style: GoogleFonts.abel(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
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
      ),
    );
  }

  Widget _buildSkillsSection(bool isMobile) {
    return Container(
      margin: EdgeInsets.all(isMobile ? 12 : 8),
      decoration: BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 20 : 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Skills',
              style: GoogleFonts.abel(
                fontSize: isMobile ? 24 : 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'I am proficient in',
              style: GoogleFonts.abel(
                fontSize: isMobile ? 14 : 16,
                color: Colors.white60,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: isMobile ? 400 : null,
              child: SkillSet(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 500;

    return Scaffold(
      backgroundColor: Color(0xFF0A0A0A),
      body: isMobile
          ? SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  SlideInDown(child: _buildProfileSectionMobile()),
                  SizedBox(height: 20),
                  SlideInUp(child: _buildSkillsSection(isMobile)),
                ],
              ),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SlideInDown(
                    child: _buildProfileSectionDesktop(),
                  ),
                ),
                Expanded(
                  child: SlideInUp(
                    child: _buildSkillsSection(isMobile),
                  ),
                ),
              ],
            ),
    );
  }
}
