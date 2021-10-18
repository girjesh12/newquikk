import 'package:logger/logger.dart';

class LogHelper {

  static void logData(var message){
    Logger().d(message);
  }

  static void logError(var message){
    Logger().e(message);
  }
}