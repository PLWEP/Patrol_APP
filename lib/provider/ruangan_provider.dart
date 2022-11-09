import 'package:flutter/cupertino.dart';
import 'package:patrol_app/data/api/api_service.dart';
import 'package:patrol_app/data/model/pertanyaan.dart';
import 'package:patrol_app/util/result_state.dart';

class RuanganProvider extends ChangeNotifier {
  final ApiService apiService;
  final String link;

  RuanganProvider({required this.apiService, required this.link}) {
    _fetchRuangan();
  }

  late Ruangan _result;
  late ResultState _state;
  String _msg = '';

  String get msg => _msg;
  Ruangan get result => _result;
  ResultState get state => _state;

  Future<dynamic> _fetchRuangan() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final ruangan = await apiService.getRuangan(link);
      if (ruangan.status == 'not found') {
        _state = ResultState.noData;
        notifyListeners();
        return _msg = 'Not Found';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _result = ruangan;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _msg = e.toString();
    }
  }
}
