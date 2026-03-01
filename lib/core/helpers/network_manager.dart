
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
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
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException({required this.message, this.statusCode, this.data});

  @override
  String toString() => 'ApiException:  (Status: )';
}

class NetworkException implements Exception {
  final String message;

  NetworkException([this.message = 'No internet connection']);

  @override
  String toString() => 'NetworkException: ';
}

class TimeoutException implements Exception {
  final String message;

  TimeoutException([this.message = 'Request timeout']);

  @override
  String toString() => 'TimeoutException: ';
}

class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException([this.message = 'Unauthorized access']);

  @override
  String toString() => 'UnauthorizedException: ';
}

class ServerException implements Exception {
  final String message;
  final int? statusCode;

  ServerException({this.message = 'Server error occurred', this.statusCode});

  @override
  String toString() => 'ServerException:  (Status: )';
}

class CancelledException implements Exception {
  final String message;

  CancelledException([this.message = 'Request cancelled']);

  @override
  String toString() => 'CancelledException: ';
}

/// ========================================== 🔥 REQUEST CANCELLATION ========================================== ///
class RequestCancellation {
  static final Map<String, CancelToken> _cancelTokens = {};

  /// Create or get cancel token for a request
  static CancelToken getToken(String key) {
    if (_cancelTokens.containsKey(key)) {
      _cancelTokens[key]!.cancel('Request cancelled due to new request');
    }
    _cancelTokens[key] = CancelToken();
    return _cancelTokens[key]!;
  }

  /// Cancel a specific request
  static void cancel(String key) {
    if (_cancelTokens.containsKey(key)) {
      _cancelTokens[key]!.cancel('Request cancelled manually');
      _cancelTokens.remove(key);
      log('🚫 Request cancelled: ');
    }
  }

  /// Cancel all requests
  static void cancelAll() {
    _cancelTokens.forEach((key, token) {
      token.cancel('All requests cancelled');
      log('🚫 Request cancelled: ');
    });
    _cancelTokens.clear();
  }

  /// Remove token after request completes
  static void removeToken(String key) {
    _cancelTokens.remove(key);
  }

  /// Check if a request is cancelled
  static bool isCancelled(String key) {
    return _cancelTokens[key]?.isCancelled ?? false;
  }
}



