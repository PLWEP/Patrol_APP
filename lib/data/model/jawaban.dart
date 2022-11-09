class Jawaban {
  Jawaban({
    required this.status,
    required this.message,
  });

  final String status;
  final String message;

  Jawaban copyWith({
    required String status,
    required String message,
  }) =>
      Jawaban(
        status: this.status,
        message: this.message,
      );

  factory Jawaban.fromJson(Map<String, dynamic> json) => Jawaban(
        status: json["status"],
        message: json["message"],
      );
}
