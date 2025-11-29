import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/change-notifier/home_notifier.dart';
import 'package:myportfolio/subsessions/widget/backdrop.dart';
import 'package:provider/provider.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Backdrop(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width <= 500 ? 20 : 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // if ((value.size(context) > 500))
                Text(
                  'About Me',
                  style: GoogleFonts.abel(
                    color: Colors.white,
                    fontSize: (value.size(context) <= 500) ? 72 : 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: (value.size(context) > 500) ? 10 : 2,
                  ),
                ),
                if ((value.size(context) > 500)) SizedBox(height: 15),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text:
                          '''Senior mobile engineer and Rust developer crafting the future of web3. School of Solana graduate building Pollinet and consumer applications that bridge traditional fintech with blockchain innovation. \n\nI'm an introvert who codes with purpose, every line of Rust, every Flutter widget, every smart contract is about solving real problems. I see complexity and find clarity. I build products that matter, even when it means pushing past my quiet nature. \n\nWhen I'm not shipping code, I'm deep in anime (2 of the big 3 and counting), reading, or letting music keep me grounded. Learning isn't just a habit—it's what keeps me curious and sharp. Still figuring things out, but showing up every day to build better.''',
                    ),
                  ]),
                  textAlign: TextAlign.start,
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
        ),
      ),
    );
  }
}
