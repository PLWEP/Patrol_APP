class Jawaban {
  Jawaban({
    required this.status,
    required this.data,
  });

  final String status;
  final List<DataJawaban> data;

  Jawaban copyWith({
    required String status,
    required List<DataJawaban> data,
  }) =>
      Jawaban(
        status: this.status,
        data: this.data,
      );

  factory Jawaban.fromJson(Map<String, dynamic> json) => Jawaban(
        status: json["status"],
        data: List<DataJawaban>.from(
            json["data"].map((x) => DataJawaban.fromJson(x))),
      );
}

class DataJawaban {
  DataJawaban({
    required this.idRuangan,
    this.jawaban1,
    this.jawaban2,
    this.jawaban3,
    this.jawaban4,
    this.jawaban5,
    this.jawaban6,
    this.jawaban7,
    this.jawaban8,
    this.jawaban9,
    this.jawaban10,
    this.createdAt,
  });

  final String idRuangan;
  final String? jawaban1;
  final String? jawaban2;
  final String? jawaban3;
  final String? jawaban4;
  final String? jawaban5;
  final String? jawaban6;
  final String? jawaban7;
  final String? jawaban8;
  final String? jawaban9;
  final String? jawaban10;
  final DateTime? createdAt;

  DataJawaban copyWith({
    required String idRuangan,
    String? jawaban1,
    String? jawaban2,
    String? jawaban3,
    String? jawaban4,
    String? jawaban5,
    String? jawaban6,
    String? jawaban7,
    String? jawaban8,
    String? jawaban9,
    String? jawaban10,
    DateTime? createdAt,
  }) =>
      DataJawaban(
        idRuangan: this.idRuangan,
        jawaban1: jawaban1 ?? this.jawaban1,
        jawaban2: jawaban2 ?? this.jawaban2,
        jawaban3: jawaban3 ?? this.jawaban3,
        jawaban4: jawaban4 ?? this.jawaban4,
        jawaban5: jawaban5 ?? this.jawaban5,
        jawaban6: jawaban6 ?? this.jawaban6,
        jawaban7: jawaban7 ?? this.jawaban7,
        jawaban8: jawaban8 ?? this.jawaban8,
        jawaban9: jawaban9 ?? this.jawaban9,
        jawaban10: jawaban10 ?? this.jawaban10,
        createdAt: createdAt ?? this.createdAt,
      );

  factory DataJawaban.fromJson(Map<String, dynamic> json) => DataJawaban(
        idRuangan: json["id_ruangan"],
        jawaban1: json["jawaban1"],
        jawaban2: json["jawaban2"],
        jawaban3: json["jawaban3"],
        jawaban4: json["jawaban4"],
        jawaban5: json["jawaban5"],
        jawaban6: json["jawaban6"],
        jawaban7: json["jawaban7"],
        jawaban8: json["jawaban8"],
        jawaban9: json["jawaban9"],
        jawaban10: json["jawaban10"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id_ruangan": idRuangan,
        "jawaban1": jawaban1,
        "jawaban2": jawaban2,
        "jawaban3": jawaban3,
        "jawaban4": jawaban4,
        "jawaban5": jawaban5,
        "jawaban6": jawaban6,
        "jawaban7": jawaban7,
        "jawaban8": jawaban8,
        "jawaban9": jawaban9,
        "jawaban10": jawaban10,
        "createdAt": createdAt?.toIso8601String(),
      };
}
