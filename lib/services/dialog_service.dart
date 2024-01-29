import 'package:flutter/material.dart';

import '../configs/constants.dart';
import '../../widgets/cs_text_button.dart';
import '../../widgets/cs_theme_date_picker.dart';
import '../../widgets/dialog-content/cs_alert_dialog.dart';
import '../../widgets/dialog-content/cs_alert_dialog_content.dart';
import 'navigation_service.dart';
import 'service_locator.dart';

final _navigatorKey = getIt<NavigationService>().navigatorKey;

bool _dialogOpen = false;
bool _modalOpen = false;
bool _showingSnack = false;
bool _canReplace = true;

Future<T?> openSimpleDialog<T>({
  required String title,
  required String description,
  List<Widget>? actions,
  DialogAction defaultAction = DialogAction.ok,
  bool tapDismiss = true,
}) async {
  actions ??= _defaultAction(defaultAction);

  _dialogOpen = true;

  return await showDialog<T>(
    context: _navigatorKey.currentContext!,
    barrierDismissible: tapDismiss,
    useSafeArea: true,
    builder: (context) {
      // ignore: deprecated_member_use
      return WillPopScope(
        onWillPop: () {
          return Future.value(tapDismiss);
        },
        child: CsAlertDialog(
          title: title,
          description: description,
          actions: actions,
        ),
      );
    },
  ).then((value) {
    _dialogOpen = false;
    return value;
  });
}

Future<dynamic> openDialogWithContent<T>({
  required Widget content,
  String? title,
  bool tapDismiss = true,
  Color? backgroundColor,
}) async {
  _dialogOpen = true;

  return await showDialog<T>(
    context: _navigatorKey.currentContext!,
    barrierDismissible: tapDismiss,
    builder: (context) {
      return CsAlertDialogContent(
        content: content,
        title: title,
        backgroundColor: backgroundColor,
      );
    },
  ).then((value) {
    _dialogOpen = false;
    return value;
  });
}

void closeDialog() {
  if (_dialogOpen) {
    Navigator.pop(_navigatorKey.currentContext!);
  }
}

void closeModal() {
  if (_modalOpen) {
    Navigator.pop(_navigatorKey.currentContext!);
  }
}

List<Widget>? _defaultAction(DialogAction defaultAction) {
  if (defaultAction == DialogAction.ok) {
    return [
      CsTextButton(
        label: 'OK',
        color: Theme.of(_navigatorKey.currentContext!).indicatorColor,
        onPressed: () => Navigator.pop(_navigatorKey.currentContext!),
      ),
    ];
  } else if (defaultAction == DialogAction.sim_nao) {
    return [
      CsTextButton(
        label: 'NÃO',
        color: Theme.of(_navigatorKey.currentContext!).indicatorColor,
        onPressed: () => Navigator.pop(_navigatorKey.currentContext!, false),
      ),
      CsTextButton(
        label: 'SIM',
        color: Theme.of(_navigatorKey.currentContext!).indicatorColor,
        onPressed: () => Navigator.pop(_navigatorKey.currentContext!, true),
      ),
    ];
  }

  return null;
}

void clearSnackBar() {
  ScaffoldMessenger.of(_navigatorKey.currentContext!).clearSnackBars();
}

void showSnackbar(
  String description, {
  int seconds = 5,
  SnackBarAction? action,
  SnackBarBehavior? behavior,
  bool canReplace = true,
}) {
  _showingSnack = true;

  if (_showingSnack && !_canReplace) {
    _canReplace = true;
    return;
  }

  _canReplace = canReplace;

  ScaffoldMessenger.of(_navigatorKey.currentContext!).removeCurrentSnackBar();

  ScaffoldMessenger.of(_navigatorKey.currentContext!).showSnackBar(SnackBar(
    content: Row(
      children: [
        // Image.asset(
        //   AssetsPath.LOGO,
        //   width: 30,
        //   height: 30,
        // ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            description,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    ),
    duration: Duration(seconds: seconds),
    behavior: behavior ?? SnackBarBehavior.floating,
    action: action,
  ));
}

void showTopSnackbar(
  String description, {
  int seconds = 5,
  SnackBarAction? action,
}) {
  final bottom = MediaQuery.of(_navigatorKey.currentContext!).size.height * 0.8;

  ScaffoldMessenger.of(_navigatorKey.currentContext!).removeCurrentSnackBar();

  ScaffoldMessenger.of(_navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          // Image.asset(
          //   AssetsPath.LOGO,
          //   width: 30,
          //   height: 30,
          // ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              description,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
      action: action,
      duration: Duration(seconds: seconds),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.none,
      margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: bottom),
    ),
  );
}

void showFixedTopSnackbar({
  required Widget content,
  SnackBarAction? action,
  int seconds = 5,
}) {
  final bottom = MediaQuery.of(_navigatorKey.currentContext!).size.height * 0.85;

  ScaffoldMessenger.of(_navigatorKey.currentContext!).removeCurrentSnackBar();

  ScaffoldMessenger.of(_navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: content,
      action: action,
      backgroundColor: Colors.transparent,
      duration: Duration(seconds: seconds),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.up,
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.symmetric(horizontal: 5).copyWith(bottom: bottom),
    ),
  );
}

Future<DateTime?> getDate({
  required DateTime? firstDate,
  required DateTime? lastDate,
  DateTime? initialDate,
  DatePickerMode datePickerMode = DatePickerMode.day,
  DatePickerEntryMode entryMode = DatePickerEntryMode.calendarOnly,
}) async {
  return await showDatePicker(
    context: _navigatorKey.currentContext!,
    locale: const Locale('pt', 'BR'),
    confirmText: 'OK',
    initialDatePickerMode: datePickerMode,
    initialEntryMode: entryMode,
    firstDate: firstDate ?? DateTime.now(), //Range inicial
    lastDate: lastDate ?? DateTime.now(), //Range final
    initialDate: initialDate ?? DateTime.now(), //Data inicial selecionada
    builder: (_, child) {
      return CsThemeDatePicker(child: child!);
    },
  );
}

Future<TimeOfDay?> getTime({
  required TimeOfDay? initialTime,
}) async {
  return await showTimePicker(
    context: _navigatorKey.currentContext!,
    confirmText: 'OK',
    cancelText: 'CANCELAR',
    initialTime: initialTime ?? TimeOfDay.now(),
    builder: (_, child) {
      return CsThemeDatePicker(child: child!);
    },
  );
}

Future<T> openModal<T>({required Widget content}) async {
  final size = MediaQuery.of(_navigatorKey.currentContext!).size;

  _modalOpen = true;

  return await showModalBottomSheet(
    context: _navigatorKey.currentContext!,
    constraints: BoxConstraints(maxHeight: size.height * 0.8),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15),
      ),
    ),
    backgroundColor: Theme.of(getIt<BuildContext>()).colorScheme.onSecondary,
    barrierColor: Colors.black54,
    builder: (_) {
      return content;
    },
  ).then((value) {
    _modalOpen = false;

    return value;
  });
}
