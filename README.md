<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

A simple widget to replicate the cool instagram gradient transition effect.

## Usage
Two required arguments are the primaryColors and secondaryColors.
Number of color objects in primaryColors and secondaryColors must contain more than 2 objects.
Number of color objects in primaryColors and secondaryColors must be more than 2.

```dart

import 'package:insta_bg/insta_bg.dart';

InstaBG(primaryColors: const [
  Color(0xFFFD746C), 
  Color(0xFFFF9068)
], secondaryColors: const [
  Color(0xFFF15F79), 
  Color(0xFFF15F79)
], child: YourWidget());


```
