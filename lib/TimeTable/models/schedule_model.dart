// lib/TimeTable/models/schedule_model.dart

class Schedule {
  final String id;
  final String from;
  final String to;
  final String time;
  final String date;

  Schedule({
    required this.id,
    required this.from,
    required this.to,
    required this.time,
    required this.date,
  });

  // Convert a Schedule to a Map
  Map<String, dynamic> toJson() => {
    "id": id,
    "from": from,
    "to": to,
    "time": time,
    "date": date,
  };

  // Create a Schedule from a Map
  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json["id"] as String,
      from: json["from"] as String,
      to: json["to"] as String,
      time: json["time"] as String,
      date: json["date"] as String,
    );
  }
}
