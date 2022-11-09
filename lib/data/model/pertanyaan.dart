class Ruangan {
  Ruangan({
    required this.status,
    required this.data,
  });

  final String status;
  final List<DataRuangan> data;

  Ruangan copyWith({
    required String status,
    required List<DataRuangan> data,
  }) =>
      Ruangan(
        status: this.status,
        data: this.data,
      );

  factory Ruangan.fromJson(Map<String, dynamic> json) => Ruangan(
        status: json["status"],
        data: List<DataRuangan>.from(
            json["data"].map((x) => DataRuangan.fromJson(x))),
      );
}

class DataRuangan {
  DataRuangan({
    required this.id,
    required this.name,
    this.pertanyaan1,
    this.pertanyaan2,
    this.pertanyaan3,
    this.pertanyaan4,
    this.pertanyaan5,
    this.pertanyaan6,
    this.pertanyaan7,
    this.pertanyaan8,
    this.pertanyaan9,
    this.pertanyaan10,
  });

  final String id;
  final String name;
  final String? pertanyaan1;
  final String? pertanyaan2;
  final String? pertanyaan3;
  final String? pertanyaan4;
  final String? pertanyaan5;
  final String? pertanyaan6;
  final String? pertanyaan7;
  final String? pertanyaan8;
  final String? pertanyaan9;
  final String? pertanyaan10;

  DataRuangan copyWith({
    required String id,
    required String name,
    String? pertanyaan1,
    String? pertanyaan2,
    String? pertanyaan3,
    String? pertanyaan4,
    String? pertanyaan5,
    String? pertanyaan6,
    String? pertanyaan7,
    String? pertanyaan8,
    String? pertanyaan9,
    String? pertanyaan10,
  }) =>
      DataRuangan(
        id: this.id,
        name: this.name,
        pertanyaan1: pertanyaan1 ?? this.pertanyaan1,
        pertanyaan2: pertanyaan2 ?? this.pertanyaan2,
        pertanyaan3: pertanyaan3 ?? this.pertanyaan3,
        pertanyaan4: pertanyaan4 ?? this.pertanyaan4,
        pertanyaan5: pertanyaan5 ?? this.pertanyaan5,
        pertanyaan6: pertanyaan6 ?? this.pertanyaan6,
        pertanyaan7: pertanyaan7 ?? this.pertanyaan7,
        pertanyaan8: pertanyaan8 ?? this.pertanyaan8,
        pertanyaan9: pertanyaan9 ?? this.pertanyaan9,
        pertanyaan10: pertanyaan10 ?? this.pertanyaan10,
      );

  factory DataRuangan.fromJson(Map<String, dynamic> json) => DataRuangan(
        id: json["id"],
        name: json["name"],
        pertanyaan1: json["pertanyaan1"],
        pertanyaan2: json["pertanyaan2"],
        pertanyaan3: json["pertanyaan3"],
        pertanyaan4: json["pertanyaan4"],
        pertanyaan5: json["pertanyaan5"],
        pertanyaan6: json["pertanyaan6"],
        pertanyaan7: json["pertanyaan7"],
        pertanyaan8: json["pertanyaan8"],
        pertanyaan9: json["pertanyaan9"],
        pertanyaan10: json["pertanyaan10"],
      );
}
