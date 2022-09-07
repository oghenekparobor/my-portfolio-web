import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:myportfolio/change-notifier/home_notifier.dart';
import 'package:myportfolio/home.dart';
import 'package:provider/provider.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({Key? key}) : super(key: key);

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
              child: SlideInRight(
                child: LeftMain(),
              ),
            ),
            Expanded(
              flex: 5,
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
