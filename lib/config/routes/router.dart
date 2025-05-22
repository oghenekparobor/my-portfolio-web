import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/config/routes/cache_route.dart';
import 'package:myportfolio/what.dart';

const String pRoot = '/';

final GlobalKey<NavigatorState> navkey = GlobalKey();

final router = GoRouter(
  navigatorKey: navkey,
  refreshListenable: CachedRouteNotifier(),
  routes: [
    // Root route
    GoRoute(
      path: pRoot,
      builder: (context, state) => const WhatDevice(),
    ),
  ],
  redirect: (context, state) {
    // Check if this route exists in cache
    final cachedRoute = CachedRouteManager.getCachedRoute(
      state.fullPath ?? pRoot,
    );
    if (cachedRoute != null) {
      // Return null to continue to the requested route with cached data
      return null;
    }

    // Normal routing, no redirection needed
    return null;
  },
  errorPageBuilder: (context, state) {
    return MaterialPage(
      child: Material(
        color: Colors.white,
        child: Center(
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                'something went wrong!',
                textStyle: GoogleFonts.abel(fontSize: 40),
              ),
            ],
          ),
        ),
      ),
    );
  },
);
