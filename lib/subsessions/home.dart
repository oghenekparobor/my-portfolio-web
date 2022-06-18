import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:myportfolio/change-notifier/home_notifier.dart';
import 'package:myportfolio/home.dart';
import 'package:provider/provider.dart';

class HomeSubSection extends StatefulWidget {
  const HomeSubSection({Key? key}) : super(key: key);

  @override
  _HomeSubSectionState createState() => _HomeSubSectionState();
}

class _HomeSubSectionState extends State<HomeSubSection>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<Offset> _anim;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    _animation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));

    _anim = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: SlideTransition(
              position: _anim,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Image.asset(
                        'assets/images/me.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.maxFinite,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'About me',
                              style: GoogleFonts.abel(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              child: Text(
                                'A Flutter (Dart) developer with 4+ year experience in mobile development. I have have knowledge in php & rust programming language',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.abel(),
                              ),
                            ),
                            SizedBox(height: 5),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () => Provider.of<HomeNotifier>(
                                  context,
                                  listen: false,
                                ).nav(1),
                                child: Text('Read more'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SlideTransition(
              position: _animation,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'What I do',
                              style: GoogleFonts.abel(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              child: Text(
                                'I solve problems ',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.abel(),
                              ),
                            ),
                            SizedBox(height: 5),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () => Provider.of<HomeNotifier>(
                                  context,
                                  listen: false,
                                ).nav(1),
                                child: Text('View portfolio'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        color: Colors.black87,
                        child: Lottie.asset('assets/images/settings.json'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
