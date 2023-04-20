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
        'technology': 'Dart',
        'percent': .92,
      },
      {
        'technology': 'Figma',
        'percent': .48,
      },
      {
        'technology': 'Flutter',
        'percent': .92,
      },
      {
        'technology': 'Git',
        'percent': .7,
      },
      {
        'technology': 'Javascript',
        'percent': .6,
      },
      {
        'technology': 'MySQL',
        'percent': .65,
      },
      {
        'technology': 'PHP',
        'percent': .6,
      },
      {
        'technology': 'Rust',
        'percent': .55,
      },
    ];

    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < _skills.length; i++)
            ElasticIn(
              delay: Duration(milliseconds: 60 * (i + 10)),
              child: Container(
                margin: EdgeInsets.only(bottom: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      _skills[i]['technology'] as String,
                      style: GoogleFonts.abel(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                      ),
                      alignment: Alignment.centerLeft,
                      child: LayoutBuilder(
                        builder: (_, c) => Container(
                          width:
                              (c.maxWidth * (_skills[i]['percent'] as double)),
                          color: Color(0xffD69976),
                          height: 10,
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
