import 'package:flutter/foundation.dart';

class LogService {
  // A static list to hold logs in memory during the session
  static final List<String> _logs = [];

  static void error(String message, [dynamic error, StackTrace? stack]) {
    final logEntry = "[${_timestamp()}] ERROR: $message ${error ?? ''}";
    _handleLog(logEntry);

    if (kDebugMode) {
      debugPrint(logEntry);
      if (stack != null) debugPrint(stack.toString());
    }
  }

  static void info(String message) {
    final logEntry = "[${_timestamp()}] INFO: $message";
    _handleLog(logEntry);
    if (kDebugMode) debugPrint(logEntry);
  }

  // 2. REFACTOR: Centralize log handling
  static void _handleLog(String entry) {
    // Optimization: Keep only the last 100 logs to prevent memory leaks
    if (_logs.length > 100) _logs.removeAt(0);
    _logs.add(entry);
  }

  // 3. CLEANER: Helper for timestamps
  static String _timestamp() => DateTime.now().toString().split(' ').last;

  static List<String> getLogs() => List.unmodifiable(_logs);

  static void clear() => _logs.clear();
}
