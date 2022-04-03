import 'package:logger/logger.dart';

// TODO add crashlytics error handler if necessary
final logger = Logger(
  printer: PrettyPrinter(
    printTime: true // Should each log print contain a timestamp
    ,
  ),
);
