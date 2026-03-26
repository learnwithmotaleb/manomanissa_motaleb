class MetricModel {
  final bool success;
  final int statusCode;
  final String message;
  final MetricData data;

  MetricModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory MetricModel.fromJson(Map<String, dynamic> json) => MetricModel(
        success: json["success"] ?? false,
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? "",
        data: MetricData.fromJson(json["data"] ?? {}),
      );
}

class MetricData {
  final List<MetricHistory> history;
  final String average;
  final SuggestionOfTheDay suggestionOfTheDay;

  MetricData({
    required this.history,
    required this.average,
    required this.suggestionOfTheDay,
  });

  factory MetricData.fromJson(Map<String, dynamic> json) => MetricData(
        history: json["history"] != null
            ? List<MetricHistory>.from(
                json["history"].map((x) => MetricHistory.fromJson(x)))
            : [],
        average: json["average"] ?? "",
        suggestionOfTheDay: SuggestionOfTheDay.fromJson(
            json["suggestionOfTheDay"] ?? {}),
      );
}

class MetricHistory {
  final DateTime date;
  final num value;

  MetricHistory({
    required this.date,
    required this.value,
  });

  factory MetricHistory.fromJson(Map<String, dynamic> json) {
    // The value key varies (totalWaterMl, totalSleepHours, etc.)
    // We take the one that is not 'date'
    num val = 0;
    json.forEach((key, value) {
      if (key != 'date' && value is num) {
        val = value;
      }
    });

    return MetricHistory(
      date: json["date"] != null ? DateTime.parse(json["date"]) : DateTime.now(),
      value: val,
    );
  }
}

class SuggestionOfTheDay {
  final String category;
  final List<String> suggestions;
  final String provider;

  SuggestionOfTheDay({
    required this.category,
    required this.suggestions,
    required this.provider,
  });

  factory SuggestionOfTheDay.fromJson(Map<String, dynamic> json) =>
      SuggestionOfTheDay(
        category: json["category"] ?? "",
        suggestions: json["suggestions"] != null
            ? List<String>.from(json["suggestions"].map((x) => x.toString()))
            : [],
        provider: json["provider"] ?? "",
      );
}
