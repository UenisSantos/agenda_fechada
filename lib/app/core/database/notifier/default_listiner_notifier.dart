import 'package:agenda_fechada/app/core/database/notifier/default_changer_notifier.dart';
import 'package:agenda_fechada/app/ui/messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class DefaultListinerNotifier {
  final DefaultChangerNotifier changernotifier;
  DefaultListinerNotifier({required this.changernotifier});

  void listiner(
      {required BuildContext context,
      required SuccessVoidCallback successVoidCallback,
      errorVoidCallback? errorCallback,
      everCallback? everCallback}) {
    changernotifier.addListener(() {
      if (everCallback != null) {
        everCallback(changernotifier, this);
      }

      if (changernotifier.loading) {
        Loader.show(context);
      } else {
        Loader.hide();
      }
      if (changernotifier.hasError) {
        if (errorCallback != null) {
          errorCallback(changernotifier, this);
        }
        Messages.of(context).ShowError(changernotifier.error ?? 'erro interno');
      } else if (changernotifier.isSuccess) {
        if (successVoidCallback != null) {
          successVoidCallback(changernotifier, this);
        }
      }
    });
  }

  void dispose() {
    changernotifier.removeListener(() {});
  }
}

typedef SuccessVoidCallback = void Function(
    DefaultChangerNotifier notifier, DefaultListinerNotifier listeneInstance);

typedef errorVoidCallback = void Function(
    DefaultChangerNotifier notifier, DefaultListinerNotifier listeneInstance);

typedef everCallback = void Function(
    DefaultChangerNotifier notifier, DefaultListinerNotifier listeneInstance);
