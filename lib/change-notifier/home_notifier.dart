import 'package:flutter/material.dart';
import 'package:myportfolio/home.dart';
import 'package:myportfolio/mobile.dart';

class HomeNotifier with ChangeNotifier {
  PageController _leftPage = PageController();
  PageController _rightPage = PageController();

  var _current = 0;

  PageController get leftPage => _leftPage;

  PageController get rightPage => _rightPage;

  int get currentPage => _current;

  void nav(int page) {
    _current = page;

    _leftPage.animateToPage(
      _current,
      duration: Duration(milliseconds: 500),
      curve: Curves.linear,
    );

    Future.delayed(Duration(milliseconds: 500)).then((value) {
      _rightPage.animateToPage(
        _current,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    });

    notifyListeners();
  }

  String title(int current) {
    switch (current) {
      case 0:
        return 'Home';
      case 1:
        return 'About';
      case 2:
        return 'Contact';

      default:
        return '';
    }
  }

  Widget display(BuildContext context) {
    var _query = MediaQuery.of(context).size.width;

    if (_query < 500) {
      return MobileHome();
    } else if (_query > 500 && _query < 950) {
      return DesktopHome();
    } else {
      return DesktopHome();
    }
  }

  double size(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
