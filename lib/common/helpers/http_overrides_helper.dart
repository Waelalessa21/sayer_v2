import 'dart:io';

class HttpOverridesHelper {
  static void configureHttpOverrides() {
    HttpOverrides.global = MyHttpOverrides();
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        if (host == 'sayersa.systems') {
          return true;
        }
        return false;
      };
  }
}
