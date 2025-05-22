import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1747916987/Guava/yp3wl395eurngrudllds.jpg',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black87.withOpacity(.8),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Oghenekparobor',
                style: GoogleFonts.abel(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                ),
              ),
              // SizedBox(height: 15),
              // Text(
              //   'A proactive, talented communicator well-versed in all aspects of mobile app development. Results-oriented with more than 5 years of experience in IT industry. Solidifies client relations and growth through improved workflows and enhanced features.',
              //   textAlign: TextAlign.start,
              //   maxLines: 4,
              //   overflow: TextOverflow.ellipsis,
              //   style: GoogleFonts.abel(
              //     color: Colors.white54,
              //     height: 1.2,
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
