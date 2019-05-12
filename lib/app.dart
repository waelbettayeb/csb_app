// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:CSB/projects_page.dart';
import 'package:flutter/material.dart';

import 'about_page.dart';
import 'backdrop.dart';
import 'colors.dart';
import 'events_page.dart';
import 'home_page.dart';
import 'join_us_page.dart';
import 'menu_page.dart';
import 'model/event.dart';
import 'supplemental/cut_corners_border.dart';
import 'package:flutter/services.dart';

class CSBApp extends StatefulWidget {
  @override
  _CSBAppState createState() => _CSBAppState();
}

class _CSBAppState extends State<CSBApp> {
  Category _currentCategory = Category.home;
  Widget _frontPage = HomePage();

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'CSB',
      debugShowCheckedModeBanner: false,
      home: Backdrop(
        currentCategory: _currentCategory,
        frontLayer: _frontPage,
        backLayer: MenuPage(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: Text(
          'CSB',
          style: TextStyle(
              color:kCSBWhite,
              fontWeight: FontWeight.w800),
        ),
        backTitle: Text(
          'MENU',
          style: TextStyle(
              color:kCSBWhite,
              fontWeight: FontWeight.w800
          ),
        ),
        subtitle: _currentCategory.toString().replaceAll('Category.', '').replaceAll('_', ' ').toUpperCase(),
      ),
      onGenerateRoute: _getRoute,
      theme: _kCSBTheme,
    );
  }

  /// Function to call when a [Category] is tapped.
  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
      switch (category){
        case Category.home:
          _frontPage = HomePage();
          break;
        case Category.events:
          _frontPage = EventsPage();
          break;
        case Category.projects:
          _frontPage = ProjectsPage();
          break;
        case Category.join_us:
          _frontPage = JoinUsPage();
          break;
        case Category.about:
          _frontPage = AboutPage();
          break;
      }
    });
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
//  if (settings.name != '/login') {
  return null;
//  }

//  return MaterialPageRoute<void>(
//    settings: settings,
//    builder: (BuildContext context) => LoginPage(),
//    fullscreenDialog: true,
//  );
}

final ThemeData _kCSBTheme = _buildCSBTheme();

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: kCSBWhite);
}

ThemeData _buildCSBTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kCSBWhite,
    primaryColor: kCSBDarkBlue,
    scaffoldBackgroundColor: kCSBBackgroundWhite,
    cardColor: kCSBBackgroundWhite,
    textSelectionColor: kCSBDarkBlue,
    errorColor: kCSBErrorRed,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: kCSBDarkBlue,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: base.iconTheme.copyWith(color: kCSBGreen),
    inputDecorationTheme: InputDecorationTheme(
      border: CutCornersBorder(),
    ),
    textTheme: _buildCSBTextTheme(base.textTheme),
    primaryTextTheme: _buildCSBTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildCSBTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

TextTheme _buildCSBTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
      fontSize: 18.0,
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    body2: base.body2.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
    subtitle: base.subtitle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
    ),
  ).apply(
    fontFamily: 'Montserrat',
    displayColor: kCSBDarkBlue,
    bodyColor: kCSBDarkBlue,
  );
}
