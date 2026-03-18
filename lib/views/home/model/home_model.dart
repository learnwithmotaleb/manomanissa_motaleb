class MetricItem {
  final num value;
  final num target;
  final String unit;

  MetricItem({required this.value, required this.target, required this.unit});

  factory MetricItem.fromJson(Map<String, dynamic> json) => MetricItem(
    value: json['value'] ?? 0,
    target: json['target'] ?? 0,
    unit: json['unit'] ?? '',
  );
}

class MetricSummary {
  final MetricItem sleep;
  final MetricItem hydration;
  final MetricItem activity;
  final MetricItem nutrition;

  MetricSummary({
    required this.sleep,
    required this.hydration,
    required this.activity,
    required this.nutrition,
  });

  factory MetricSummary.fromJson(Map<String, dynamic> json) => MetricSummary(
    sleep: MetricItem.fromJson(json['sleep']),
    hydration: MetricItem.fromJson(json['hydration']),
    activity: MetricItem.fromJson(json['activity']),
    nutrition: MetricItem.fromJson(json['nutrition']),
  );
}

class ProgressionItem {
  final String date;
  final String day;
  final num score;

  ProgressionItem({required this.date, required this.day, required this.score});

  factory ProgressionItem.fromJson(Map<String, dynamic> json) => ProgressionItem(
    date: json['date'] ?? '',
    day: json['day'] ?? '',
    score: json['score'] ?? 0,
  );
}

class HomeModel {
  final String greeting;
  final num todayScore;
  final MetricSummary metricSummary;
  final List<ProgressionItem> progression;

  HomeModel({
    required this.greeting,
    required this.todayScore,
    required this.metricSummary,
    required this.progression,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return HomeModel(
      greeting: data['greeting'] ?? '',
      todayScore: data['todayScore'] ?? 0,
      metricSummary: MetricSummary.fromJson(data['metricSummary']),
      progression: (data['progression'] as List<dynamic>)
          .map((e) => ProgressionItem.fromJson(e))
          .toList(),
    );
  }
}