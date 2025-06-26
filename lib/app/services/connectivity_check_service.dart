import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final internetConnectivityCheckerServiceProvider =
    Provider<ConnectivityCheckService>((ref) {
  return ConnectivityCheckService();
});

class ConnectivityCheckService {
  ConnectivityCheckService() {
    _initialize();
  }

  final Connectivity _connectivity = Connectivity();
  bool hasConnection = false;
  ConnectivityResult? connectionMedium;
  final StreamController<bool> _connectionChangeController =
      StreamController<bool>.broadcast();

  Stream<bool> get connectionChange => _connectionChangeController.stream;

  void _initialize() {
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      _checkInternetConnection();
    });
  }

  Future<bool> _checkInternetConnection() async {
    bool previousConnection = hasConnection;
    try {
      final result = await InternetAddress.lookup('google.com');
      hasConnection = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException {
      hasConnection = false;
    }
    if (previousConnection != hasConnection) {
      _connectionChangeController.add(hasConnection);
    }
    return hasConnection;
  }

  void dispose() {
    _connectionChangeController.close();
  }
}
