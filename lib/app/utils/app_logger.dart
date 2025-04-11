import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
class AppLogger {
  AppLogger._privateConstructor();
  static consoleLog(msg) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(now);
    var logger = Logger(
      //printer: PrettyPrinter(),

    );
    logger.d('$formattedDate : $msg');
    //Get.log('$formattedDate : $msg');
  }
}
