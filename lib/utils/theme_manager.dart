import 'package:flutter/material.dart';

ValueNotifier<bool> themeNotifier = ValueNotifier(false);

void toggleTheme() {
  themeNotifier.value = !themeNotifier.value;
}
