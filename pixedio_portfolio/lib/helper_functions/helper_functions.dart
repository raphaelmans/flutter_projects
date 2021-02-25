import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

Size getContextSize(context) {
  return MediaQuery.of(context).size;
}

Orientation getContextOrientation(context) {
  return MediaQuery.of(context).orientation;
}

double headingTextSize(width) {
  var fontsize = 56.0;
  if (width < 1400) {
    fontsize = 36;
  }
  if (width < 800) {
    fontsize = 24;
  }
  if (width < 420) {
    fontsize = 18;
  }
  return fontsize;
}

redirectDiscord() async {
  const url = 'https://discord.gg/W9jGNP4JvS';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

double bodyFontSize(width) {
  var fontsize = 18.0;
  if (width < 1076) {
    fontsize = 18;
  }
  if (width < 800) {
    fontsize = 16;
  }
  if (width < 420) {
    fontsize = 14;
  }
  return fontsize;
}

double sectionTextSize(width) {
  var fontsize = 56.0;
  if (width < 1076) {
    fontsize = 56;
  }
  if (width < 420) {
    fontsize = 56;
  }
  return fontsize;
}

double getInputWidth(size) {
  var width = kInputWidth;
  if (size.width <= 500) {
    width = 300;
  }
  return width;
}
