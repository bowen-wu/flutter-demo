import 'package:flutter/material.dart';

class ToolsFunction {
  static bool isChinaPhoneLegal(String str) {
    return new RegExp(
            '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
        .hasMatch(str);
  }

  static void goToPage(context, pageRoute, Object arguments, [String type]) {
    switch (type) {
      case 'pop':
        Navigator.of(context).pop(context);
        break;
      case 'root':
        Navigator.of(context).popUntil((route) => route.isFirst);
        break;
      default:
        Navigator.of(context).pushNamed(pageRoute, arguments: arguments);
    }
  }
}
