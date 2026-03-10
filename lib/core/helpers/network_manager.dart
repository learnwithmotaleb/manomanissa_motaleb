import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

/// ========================================== 🔥 NETWORK MANAGER (Static Methods for Main.dart) ========================================== ///
class NetworkManager {
  /// ✅ Check if device has internet connection
  static Future<bool> hasConnection() async {
    try {
      final connectivityResults = await Connectivity().checkConnectivity();

      if (connectivityResults.contains(ConnectivityResult.none)) {
        return false;
      }

      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  /// ✅ Stream for monitoring connection changes (for main.dart offline screen logic)
  static Stream<bool> connectionStream() async* {
    await for (var results in Connectivity().onConnectivityChanged) {
      if (results.contains(ConnectivityResult.none)) {
        yield false;
      } else {
        // Double check with actual internet
        final hasInternet = await hasConnection();
        yield hasInternet;
      }
    }
  }
}

/// ========================================== 🔥 NETWORK CHECKER (GetX Controller for API Calls) ========================================== ///
class NetworkChecker extends GetxController {
  static NetworkChecker get instance => Get.find<NetworkChecker>();

  final Connectivity _connectivity = Connectivity();
  final RxBool isConnected = true.obs;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  Future<void> _initConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _updateConnectionStatus(result);
    } catch (e) {
      isConnected.value = false;
    }
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    final result = results.isNotEmpty ? results.first : ConnectivityResult.none;

    if (result == ConnectivityResult.none) {
      isConnected.value = false;
    } else {
      _checkInternetConnection();
    }
  }

  Future<void> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      isConnected.value = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isConnected.value = false;
    }
  }

  /// ✅ Used by API Client to check connection before making requests
  Future<bool> hasConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription?.cancel();
    super.onClose();
  }
}

/// ========================================== 🔥 CUSTOM EXCEPTIONS ========================================== ///




/// ========================================== 🔥 REQUEST CANCELLATION ========================================== ///



