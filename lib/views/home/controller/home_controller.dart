import 'package:fl_chart/fl_chart.dart';

import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';
import '../model/home_model.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  final homeData = Rxn<HomeModel>();
  final selectedDays = 7.obs;
  final GlobalKey boundaryKey = GlobalKey();

  // Progression data আলাদা store করা
  final spots7Days = <FlSpot>[].obs;
  final spots30Days = <FlSpot>[].obs;
  final labels7Days = <String>[].obs;
  final labels30Days = <String>[].obs;

  String get userName {
    final greeting = homeData.value?.data.greeting ?? '';
    // "Hello, Inès Laurent" → "Inès Laurent"
    if (greeting.contains(', ')) return greeting.split(', ').last;
    if (greeting.contains(' ')) return greeting.split(' ').sublist(1).join(' ');
    return greeting;
  }

  num get todayScore => homeData.value?.data.todayScore ?? 0;

  String get dynamicCharacterPath {
    final factor = homeData.value?.data.mood.primaryFactor.toLowerCase() ?? '';
    switch (factor) {
      case 'sleep':
        return Assets.dummy.sleeping.path;
      case 'hydration_liters':
        return Assets.dummy.dringking.path;
      case 'steps':
        return Assets.dummy.activityJogging.path;
      case 'calories':
        return Assets.dummy.aann.path;
      default:
        return Assets.dummy.aann.path;
    }
  }

  // Dummy metrics getters to keep HomeInfoCard from throwing errors since API no longer provides these
  double get sleepVal => 0.0;
  double get sleepTarget => 8.0;
  double get hydVal => 0.0;
  double get hydTarget => 3.0;
  double get actVal => 0.0;
  double get actTarget => 6000.0;
  double get nutVal => 0.0;
  double get nutTarget => 2500.0;

  List<FlSpot> get currentSpots =>
      selectedDays.value == 7 ? spots7Days : spots30Days;

  List<String> get currentLabels =>
      selectedDays.value == 7 ? labels7Days : labels30Days;


  double get maxScore {
    final spots = currentSpots;
    if (spots.isEmpty) return 10;
    final max = spots.map((e) => e.y).reduce((a, b) => a > b ? a : b);
    return max < 10 ? 10 : max + 20;
  }

  @override
  void onInit() {
    super.onInit();
    fetchHomeData(days: 7);
  }

  void onDaysChanged(int days) {
    selectedDays.value = days;
    if (days == 30 && spots30Days.isEmpty) {
      fetchHomeData(days: 30);
    }
  }

  Future<void> fetchHomeData({required int days}) async {
    await ApiRequest().get(
      fromJson: HomeModel.fromJson,
      endPoint: '/dashboard/home',
      isLoading: isLoading,
      queryParams: {'days': days},
      onSuccess: (result) {
        homeData.value = result;
        final spots = result.data.progression
            .asMap()
            .entries
            .map((e) => FlSpot(e.key.toDouble(), e.value.score.toDouble()))
            .toList();
        final labels = result.data.progression.map((e) => e.day).toList();

        if (days == 7) {
          spots7Days.assignAll(spots);
          labels7Days.assignAll(labels);
        } else {
          spots30Days.assignAll(spots);
          labels30Days.assignAll(labels);
        }
      },
    );
  }

  Future<void> shareScreenshot() async {
    try {
      // Small delay to ensure any ripple effect is done
      await Future.delayed(const Duration(milliseconds: 50));

      final boundary = boundaryKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) {
        CustomSnackBar.error('Failed to capture screenshot');
        return;
      }

      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final pngBytes = byteData?.buffer.asUint8List();

      if (pngBytes != null) {
        final directory = await getTemporaryDirectory();
        final imagePath = await File('${directory.path}/screenshot.png').create();
        await imagePath.writeAsBytes(pngBytes);
        
        await Share.shareXFiles(
          [XFile(imagePath.path)], 
          text: 'Check out my progress on Manomanissa!',
          sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10),
        );
      } else {
        CustomSnackBar.error('Failed to encode screenshot');
      }
    } catch (e) {
      CustomSnackBar.error('Error sharing screenshot: $e');
    }
  }
}