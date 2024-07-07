import 'package:flutter/material.dart';

// screen size helpers
double screenWidth(context) => MediaQuery.of(context).size.width;
double screenHeight(context) => MediaQuery.of(context).size.height;
double statusBarHeight(context) =>  MediaQuery.of(context).viewPadding.top;

// screen size helpers
bool isMobileSize(context) => screenWidth(context) <= 600;
bool isTabletSize(context) =>
    screenWidth(context) > 600 && screenWidth(context) < 1280;

