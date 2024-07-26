import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:logger/logger.dart';

abstract class SafeProvider extends ChangeNotifier {
  /// Add [isSafe] boolean for when [notifyListeners] called but context is not in [WidgetTree] anymore.
  bool isSafe = true;

  final Logger _logger = Logger(printer: SimplePrinter());
  final BuildContext context;

  /// Call [initState] constructor create.
  SafeProvider(this.context) {
    _logger.i('${runtimeType.toString()} Initialized');
    initState();
  }

  /// Add [initState] function for when [Provider] created.
  /// before first frame is send to screen.
  /// Perform an action after the build is completed
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) => onReady());
  }

  /// Add [onReady] function for when first Frame is printed on screen.
  /// good option for opening [Overlays] or running [Animations]
  void onReady() {}

  @override
  void notifyListeners() {
    if (isSafe == false) return;
    super.notifyListeners();
  }

  @override
  void dispose() {
    _logger.w('${runtimeType.toString()} Disposed');
    isSafe = false;
    super.dispose();
  }
}
