import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:insta_bg/insta_bg.dart';

void main() {
  test('Testing Internally', () {
    final bg = InstaBG(primaryColors: const [
      Color(0xFFFD746C),
      Color(0xFFFF9068)
    ], secondaryColors: const [
      Color(0xFFF15F79),
      Color(0xFFF15F79)
    ]);
    assert(bg != null);
    assert(bg is Widget);
  });
}
