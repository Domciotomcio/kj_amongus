import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';

Future<T?> handleFirestoreError<T>(
    String operation, Future<T?> Function() action) async {
  try {
    return await action();
  } on FirebaseException catch (e) {
    log("Firebase error during $operation: ${e.message}");
    return null;
  } catch (e, stacktrace) {
    log("Unexpected error during $operation: $e",
        error: e, stackTrace: stacktrace);
    return null;
  }
}
