import 'dart:convert';
import 'package:patrol_app/data/model/jawaban.dart';
import 'package:patrol_app/data/model/pertanyaan.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Ruangan> getRuangan(String url) async {
    final response = await http.get(Uri.parse("http://$url"));
    if (response.statusCode == 200) {
      return Ruangan.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Jawaban> postJawaban(Map<dynamic, dynamic> data, String url) async {
    final response = await http.post(
        Uri.parse("http://${url.replaceAll("ruangan", "jawaban")}"),
        body: data);
    if (response.statusCode == 200) {
      return Jawaban.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post data');
    }
  }
}
