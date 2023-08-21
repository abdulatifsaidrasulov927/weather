class TimesModel {
  final String tong_saharlik;
  final String quyosh;
  final String peshin;
  final String asr;
  final String shom_iftor;
  final String hufton;

  TimesModel({
    required this.tong_saharlik,
    required this.quyosh,
    required this.peshin,
    required this.asr,
    required this.shom_iftor,
    required this.hufton,
  });

  factory TimesModel.fromJson(Map<String, dynamic> json) {
    return TimesModel(
      tong_saharlik: json['tong_saharlik'] ?? "",
      quyosh: json['quyosh'] ?? "",
      peshin: json['peshin'] ?? "",
      asr: json['asr'] ?? "",
      shom_iftor: json['shom_iftor'] ?? "",
      hufton: json['hufton'] ?? "",
    );
  }
}
