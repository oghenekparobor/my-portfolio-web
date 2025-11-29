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

    // Animate right page immediately (used for both mobile and desktop)
    _rightPage.animateToPage(
      _current,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );

    // Animate left page with delay (only used on desktop)
    if (_leftPage.hasClients) {
      Future.delayed(Duration(milliseconds: 300)).then((value) {
        if (_leftPage.hasClients) {
          _leftPage.animateToPage(
            _current,
            duration: Duration(milliseconds: 600),
            curve: Curves.easeInOutCubic,
          );
        }
      });
    }

    notifyListeners();
  }

  String title(int current) {
    switch (current) {
      case 0:
        return 'Home';
      case 1:
        return 'About';
      case 2:
        return 'Hackathons';
      case 3:
        return 'Contact';

      default:
        return '';
    }
  }

  Widget display(BuildContext context) {
    var _query = MediaQuery.of(context).size.width;

    if (_query <= 500) {
      return MobileHome();
    } else {
      return DesktopHome();
    }
  }

  double size(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
