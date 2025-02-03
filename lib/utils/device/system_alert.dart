import 'package:flutter/material.dart';
import 'package:uop_sports_v3/components/dialog/alert_dialog.dart';

class SystemAlert {
  //system snackBar
  static void showSnackBar(context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ));
  }

  static void oneActionAlertDialog(context, String title, String message,
      String confirmText, Function() trueCase) async {
    final tryAgain = AppAlertDialog(
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      title: title,
      confirmText: confirmText,
    ).show(context, false);
    if (await tryAgain) {
      trueCase();
    }
  }

  static void twoActionAlertDialog(
      context,
      String title,
      String message,
      String confirmText,
      String cancelText,
      Function() trueCase,
      Function() falseCase) async {
    final tryAgain = AppAlertDialog(
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      title: title,
      confirmText: confirmText,
      cancelText: cancelText,
    ).show(context, false);
    if (await tryAgain) {
      trueCase();
    } else {
      falseCase();
    }
  }

  //system snackBar
  static void showActionedSnackBar(
      context, String message, String action, void Function() onPressed) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        action: SnackBarAction(
          label: action,
          onPressed: onPressed,
          textColor: Theme.of(context).colorScheme.onPrimary,
        ),
      ));
  }

  static void showSpinnerDialog(context) {
    showAdaptiveDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => const CircularProgressIndicator.adaptive());
  }

  static void showLoadingDialog(context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: AppAlertDialog(
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LinearProgressIndicator(),
              ],
            ),
            title: message,
          ),
        );
      },
    );
  }

  static void showDisconnectSnackBar(context, String message) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).viewInsets.top + 140,
        left: 0,
        right: 0,
        child: GestureDetector(
          onTap: () {
            overlayEntry.remove();
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.error,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }

  static void showConnectedSnackBar(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).viewInsets.top + 140,
        left: 0,
        right: 0,
        child: GestureDetector(
          onTap: () {
            overlayEntry.remove();
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}
