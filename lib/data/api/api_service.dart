import 'dart:convert';
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
}
