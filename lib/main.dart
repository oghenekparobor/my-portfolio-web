import 'package:flutter/material.dart';
import 'package:myportfolio/change-notifier/home_notifier.dart';
import 'package:myportfolio/config/routes/router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeNotifier()),
      ],
      child: MaterialApp(
        title: 'Oghenekparobor\'s Portfolio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.autoScaleDown(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(
            color: Color(0xFFF5F5F5),
          ),
        ),
        onGenerateRoute: (s) => MyRouter.generateRoute(s),
        initialRoute: home,
      ),
    );
  }
}
