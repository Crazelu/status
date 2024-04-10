import 'package:flutter/widgets.dart';
import 'package:flutter_dialog_manager/flutter_dialog_manager.dart';
import 'package:status/core/dialog/dialog_routes.dart';
import 'package:status/features/home/presentation/dialogs/event_details_dialog.dart';

class DialogGenerator {
  static Widget? onGenerateDialog(DialogSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case DialogRoutes.eventDetails:
        if (arg is EventDetailsDialogMessage) {
          return EventDetailsDialog(message: arg);
        }
        return null;

      default:
        return null;
    }
  }
}
