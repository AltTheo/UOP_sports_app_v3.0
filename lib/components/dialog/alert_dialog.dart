import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:uop_sports_v3/components/headings/heading_three.dart';
import 'package:uop_sports_v3/components/headings/heading_two.dart';
import 'package:uop_sports_v3/utils/device/platform_widget.dart';

class AppAlertDialog extends PlatformWidget<AlertDialog, AlertDialog> {
  const AppAlertDialog({
    super.key,
    this.cancelText,
    this.confirmText,
    required this.content,
    this.icon,
    required this.title,
    this.onTapDisagree,
    this.onTapAgree,
    this.actions,
    this.alertColor,
  });

  final Widget content;
  final Widget? icon;
  final String title;
  final Color? alertColor;
  final List<Widget>? actions;
  final void Function()? onTapDisagree;
  final void Function()? onTapAgree;
  final String? cancelText;
  final String? confirmText;

  @override
  AlertDialog buildCupertinoWidget(BuildContext context) {
    return AlertDialog(
      title: HeadingThree(
        title: title,
        color: Theme.of(context).colorScheme.primary,
      ),
      content: content,
      actions: _actions(
        context,
        cancelText?.toUpperCase(),
        confirmText?.toUpperCase(),
      ),
    );
  }

  @override
  AlertDialog buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: HeadingTwo(
        title: title,
        color: Theme.of(context).colorScheme.primary,
      ),
      content: content,
      actions: _actions(
        context,
        cancelText?.toUpperCase(),
        confirmText?.toUpperCase(),
      ),
    );
  }

  List<Widget> _actions(
      BuildContext context, String? cancelText, String? confirmText) {
    var actions = <Widget>[];
    actions.add(PlatformAlertDialogAction(
      child: Text(cancelText ?? ''),
      onPressed: () => dismiss(context, false),
    ));
    actions.add(PlatformAlertDialogAction(
        child: Text(
          confirmText ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: () => dismiss(context, true)));
    return actions;
  }

  Future<bool> show(BuildContext context, bool isDismissible) async {
    final result = await showDialog<bool>(
        context: context,
        barrierDismissible: isDismissible,
        builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), child: this));
    return Future.value(result ?? false);
  }

  void dismiss(BuildContext context, bool value) {
    Navigator.of(context, rootNavigator: true).pop(value);
  }
}

class PlatformAlertDialogAction extends PlatformWidget<TextButton, TextButton> {
  final Widget? child;
  final VoidCallback? onPressed;

  const PlatformAlertDialogAction({
    super.key,
    this.child,
    this.onPressed,
  });

  @override
  TextButton buildCupertinoWidget(BuildContext context) {
    return TextButton(
        onPressed: onPressed, child: child ?? const SizedBox.shrink());
  }

  @override
  TextButton buildMaterialWidget(BuildContext context) {
    return TextButton(
        onPressed: onPressed, child: child ?? const SizedBox.shrink());
  }
}
