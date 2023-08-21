import 'package:weather/modul/times_model.dart';

class RegionModel {
  final String region;
  final String date;
  final String weekday;
  final TimesModel times;

  RegionModel({
    required this.region,
    required this.date,
    required this.weekday,
    required this.times,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
      region: json['region'] ?? "",
      date: json['date'] ?? "",
      weekday: json['weekday'] ?? "",
      times: TimesModel.fromJson(json['times']),
    );
  }
}
