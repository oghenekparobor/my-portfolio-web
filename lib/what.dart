import 'package:flutter/material.dart';
import 'package:myportfolio/change-notifier/home_notifier.dart';
import 'package:provider/provider.dart';

class WhatDevice extends StatelessWidget {
  const WhatDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, value, child) => value.display(context),
    );
  }
}
