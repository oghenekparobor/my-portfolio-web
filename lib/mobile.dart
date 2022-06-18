import 'package:flutter/material.dart';
import 'package:myportfolio/change-notifier/home_notifier.dart';
import 'package:myportfolio/home.dart';
import 'package:provider/provider.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({Key? key}) : super(key: key);

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    _animation = Tween<Offset>(
      begin: const Offset(1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInCubic));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeNotifier>(
        builder: (context, value, child) => Column(
          children: [
            Expanded(
              flex: 2,
              child: SlideTransition(
                position: _animation,
                child: LeftMain(),
              ),
            ),
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  RightMain(),
                  if (value.size(context) < 500) FooterLinks()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
