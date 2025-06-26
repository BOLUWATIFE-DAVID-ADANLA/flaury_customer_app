// import 'package:logger/web.dart';

// class Loggercustom {
//   // create a singleton instance
//   final logger = Logger(
//     printer: PrettyPrinter(
//       methodCount: 0, // number of method calls to be displayed
//       errorMethodCount: 5, // number of method calls to be displayed for errors
//       colors: true, // enable colors
//       printEmojis: true, // enable emojis
//       lineLength: 20,
//     ),
//   );

//   // define the method fro logging messages

//   //trace method
//   void traceLog(String message) {
//     logger.t(message);
//   }

//   // debug method
//    void traceLog(String message) {
//     logger.t(message);
//   }


//   // info method
//    void traceLog(String message) {
//     logger.t(message);
//   }


//   //error method
//    void traceLog(String message) {
//     logger.t(message);
//   }


//   // warring method
//    void traceLog(String message) {
//     logger.t(message);
//   }


//   //fatal method
//    void traceLog(String message) {
//     logger.t(message);
//   }

// }


// extension loggerCustom on Logger {
//   void t(String message) => t(message);
//   void d(String message) => debug(message);
//   void i(String message) => info(message);
//   void e(String message) => error(message);
//   void w(String message) => warning(message);
//   void f(String message) => fatal(message);
// }