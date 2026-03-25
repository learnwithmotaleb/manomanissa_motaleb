class HomeModel {
  final bool success;
  final int statusCode;
  final String message;
  final Data data;

  HomeModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    success: json["success"] ?? false,
    statusCode: json["statusCode"] ?? 200,
    message: json["message"] ?? '',
    data: Data.fromJson(json["data"] ?? {}),
  );
}

class Data {
  final String greeting;
  final String gender;
  final int todayScore;
  final Mood mood;
  final List<Progression> progression;

  Data({
    required this.greeting,
    required this.gender,
    required this.todayScore,
    required this.mood,
    required this.progression,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    greeting: json["greeting"] ?? '',
    gender: json["gender"] ?? '',
    todayScore: json["todayScore"] ?? 0,
    mood: json["mood"] != null ? Mood.fromJson(json["mood"]) : Mood(primaryFactor: ''),
    progression: json["progression"] != null 
        ? List<Progression>.from(json["progression"].map((x) => Progression.fromJson(x)))
        : [],
  );
}

class Mood {
  final String primaryFactor;

  Mood({
    required this.primaryFactor,
  });

  factory Mood.fromJson(Map<String, dynamic> json) => Mood(
    primaryFactor: json["primary_factor"] ?? '',
  );
}

class Progression {
  final DateTime date;
  final String day;
  final int score;

  Progression({
    required this.date,
    required this.day,
    required this.score,
  });

  factory Progression.fromJson(Map<String, dynamic> json) => Progression(
    date: json["date"] != null ? DateTime.parse(json["date"]) : DateTime.now(),
    day: json["day"] ?? '',
    score: json["score"] ?? 0,
  );
}
