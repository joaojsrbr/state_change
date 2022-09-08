// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'inherited_listwidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'inherited_widget.dart';

class StateListChange<T> extends StatelessWidget {
  const StateListChange({
    super.key,
    this.debugW,
    required this.notifier,
    required this.builder,
  });

  final DebugW? debugW;
  final List<ValueNotifier<T>> notifier;
  final Widget Function(BuildContext context, T first, T last) builder;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      if (debugW?.key == true) {
        print(context.widget.key.toString());
      }
    }
    return InheritedlistWidgetValueNotifier(
      lista: notifier,
      child: Builder(
        builder: (context) {
          if (kDebugMode) {
            if (debugW?.value == true) {
              print(InheritedlistWidgetValueNotifier.of<T>(context).first);
              print(InheritedlistWidgetValueNotifier.of<T>(context).last);
            }
          }

          return builder(
            context,
            InheritedlistWidgetValueNotifier.of<T>(context).first,
            InheritedlistWidgetValueNotifier.of<T>(context).last,
          );
        },
      ),
    );
  }
}

class StateChange<T> extends StatelessWidget {
  const StateChange({
    super.key,
    this.debugW,
    required this.notifier,
    required this.builder,
  });

  final DebugW? debugW;
  final ValueNotifier<T> notifier;
  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      if (debugW?.key == true) {
        print(context.widget.key.toString());
      }
    }
    return InheritedWidgetValueNotifier(
      notifier: notifier,
      child: Builder(
        builder: (context) {
          if (kDebugMode) {
            if (debugW?.value == true) {
              print(InheritedWidgetValueNotifier.of<T>(context).value);
            }
          }
          return builder(
            context,
            InheritedWidgetValueNotifier.of<T>(context).value,
          );
        },
      ),
    );
  }
}

class DebugW {
  final bool key;

  final bool value;
  DebugW({
    this.key = false,
    this.value = false,
  });
}
