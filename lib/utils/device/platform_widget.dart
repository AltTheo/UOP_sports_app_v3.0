import 'dart:io';

import 'package:flutter/material.dart';

abstract class PlatformWidget<C extends Widget, M extends Widget>
    extends StatelessWidget {
  const PlatformWidget({super.key});

  C buildCupertinoWidget(BuildContext context);
  M buildMaterialWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return buildCupertinoWidget(context);
    }
    return buildMaterialWidget(context);
  }
}
