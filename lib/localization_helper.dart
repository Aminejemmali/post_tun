import 'package:flutter/material.dart';

class LocalizationHelper {
  static Locale getCurrentLocale(BuildContext context) {
    return Localizations.localeOf(context);
  }

  static bool isArabic(BuildContext context) {
    return getCurrentLocale(context).languageCode == 'ar';
  }

  // Add more helper methods as needed.
}
