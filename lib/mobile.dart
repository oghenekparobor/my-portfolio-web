import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/change-notifier/home_notifier.dart';
import 'package:myportfolio/subsessions/about.dart';
import 'package:myportfolio/subsessions/contact.dart';
import 'package:myportfolio/subsessions/hackathons.dart';
import 'package:myportfolio/subsessions/home.dart';
import 'package:provider/provider.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({Key? key}) : super(key: key);

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Color(0xFF0A0A0A),
        body: PageView(
          controller: value.rightPage,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            HomeSubSection(),
            AboutSubSection(),
            HackathonsSubSection(),
            ContactSubSection(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Color(0xFF1A1A1A),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            child: Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(context, value, 0, Icons.home, 'Home'),
                  _buildNavItem(context, value, 1, Icons.person, 'About'),
                  _buildNavItem(context, value, 2, Icons.emoji_events, 'Hackathons'),
                  _buildNavItem(context, value, 3, Icons.contact_mail, 'Contact'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    HomeNotifier notifier,
    int index,
    IconData icon,
    String label,
  ) {
    final isSelected = notifier.currentPage == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => notifier.nav(index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? Color(0xffC59344).withOpacity(0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? Color(0xffC59344) : Colors.white60,
                size: 22,
              ),
              SizedBox(height: 4),
              Text(
                label,
                style: GoogleFonts.abel(
                  fontSize: 10,
                  color: isSelected ? Color(0xffC59344) : Colors.white60,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
