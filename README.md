A simple widget to replicate the cool instagram gradient transition effect.

## Usage
Two required arguments are the primaryColors and secondaryColors.
Number of color objects in primaryColors and secondaryColors must contain more than 2 objects.
Number of color objects in primaryColors and secondaryColors must be more than 2.

```dart

import 'package:knight_insta_bg/knight_insta_bg.dart';

KnightInstaBG(primaryColors: const [
  Color(0xFFFD746C), 
  Color(0xFFFF9068)
], secondaryColors: const [
  Color(0xFFFF0735), 
  Color(0xFFF15F79)
], child: YourWidget());
```

Note: To change the color animation behavior, play with primaryBegin, primaryEnd, secondaryBegin and secondaryEnd.

## Available properties

| Property          | Type                 | Description                                                                                                      |
|-------------------| -------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `primaryColors`   | List                 | Starting colors of the animation.                                                                                |
| `secondaryColors` | List                 | Ending colors of the animation.                                                                                  |
| `primaryBegin`    | AlignmentGeometry?   | Starting alignment of primaryColrs.                                                                              |
| `primaryEnd`      | AlignmentGeometry?   | Ending alignment of primaryColrs.                                                                                |
| `secondaryBegin`  | AlignmentGeometry?   | Starting alignment of secondaryColors.                                                                           |
| `secondaryEnd`    | AlignmentGeometry?   | Ending alignment of secondaryColors.                                                                             |
| `duration`        | Duration?            | Duration between the transition.                                                                                 |
| `child`           | Widget?              | You can pass your own widget.                                                                                    |

## Author

This plugin is developed by Atirek Pothiwala.
