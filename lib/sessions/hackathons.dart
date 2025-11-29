import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/change-notifier/home_notifier.dart';
import 'package:myportfolio/subsessions/widget/backdrop.dart';
import 'package:provider/provider.dart';

class HackathonsSection extends StatelessWidget {
  const HackathonsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Backdrop(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Hackathons',
                  style: GoogleFonts.abel(
                    color: Colors.white,
                    fontSize: (value.size(context) > 500) ? 72 : 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: (value.size(context) > 500) ? 10 : 2,
                  ),
                ),
                if ((value.size(context) > 500)) SizedBox(height: 15),
                Text(
                  'Building innovative solutions under pressure. Here are the hackathons I\'ve participated in.',
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.abel(
                    color: Colors.white54,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

