import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillSet extends StatefulWidget {
  const SkillSet({
    Key? key,
  }) : super(key: key);

  @override
  State<SkillSet> createState() => _SkillSetState();
}

class _SkillSetState extends State<SkillSet> {
  @override
  Widget build(BuildContext context) {
    var _skills = [
      {
        'technology': 'Rust',
        'percent': .65,
      },
      {
        'technology': 'Flutter',
        'percent': .95,
      },
      {
        'technology': 'Solana',
        'percent': .65,
      },
      {
        'technology': 'Git',
        'percent': .85,
      },
      {
        'technology': 'Anchor',
        'percent': .65,
      },
      {
        'technology': 'Smart Contracts',
        'percent': .65,
      },
      {
        'technology': 'SPL Token',
        'percent': .65,
      },
      {
        'technology': 'TypeScript',
        'percent': .55,
      },
      {
        'technology': 'Web3.js',
        'percent': .55,
      },
    ];

    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < _skills.length; i++)
            SlideInUp(
              delay: Duration(milliseconds: 60 * (i + 10)),
              child: Container(
                margin: EdgeInsets.only(bottom: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _skills[i]['technology'] as String,
                          style: GoogleFonts.abel(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          '${((_skills[i]['percent'] as double) * 100).toInt()}%',
                          style: GoogleFonts.abel(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xffC59344),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 12,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.centerLeft,
                      child: LayoutBuilder(
                        builder: (_, c) => AnimatedContainer(
                          duration: Duration(milliseconds: 800 + (i * 100)),
                          curve: Curves.easeOutCubic,
                          width: (c.maxWidth * (_skills[i]['percent'] as double)),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xffC59344),
                                Color(0xffD69976),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffC59344).withOpacity(0.3),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          height: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
