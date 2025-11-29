import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/subsessions/widget/backdrop.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Backdrop(
      child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width <= 500 ? 20 : 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Text(
                    'oghenekparobor.sol',
                    style: GoogleFonts.abel(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width <= 500 ? 28 : 38,
                      fontWeight: FontWeight.bold,
                      letterSpacing: MediaQuery.of(context).size.width <= 500 ? 4 : 8,
                      height: 1.2,
                    ),
                  ),
                  Positioned(
                    top: -40,
                    left: -20,
                    child: Transform.rotate(
                      angle: 0.261799,
                      child: InkWell(
                        onTap: () {
                          launchUrl(Uri.parse('https://solscan.io/account/RtsKQm3gAGL1Tayhs7ojWE9qytWqVh4G7eJTaNJs7vX#portfolionfts'));
                        },
                        child: Image.asset(
                          'assets/badge.PNG',
                          width: 45,
                          height: 45,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Container(
                width: MediaQuery.of(context).size.width <= 500 ? 200 : 330,
                height: 4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffC59344),
                      Color(0xffD69976),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
