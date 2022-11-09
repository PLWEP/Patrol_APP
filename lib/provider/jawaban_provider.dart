import 'package:flutter/cupertino.dart';
import 'package:patrol_app/data/api/api_service.dart';
import 'package:patrol_app/data/model/jawaban.dart';
import 'package:patrol_app/util/result_state.dart';

class JawabanProvider extends ChangeNotifier {
  final ApiService apiService;

  JawabanProvider({required this.apiService});
  late Jawaban _result;
  ResultState _state = ResultState.ready;
  late Map<dynamic, dynamic> _data;

  Jawaban get result => _result;

  ResultState get state => _state;

  Future<dynamic> postJawaban(
    String url,
  ) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final jawaban = await apiService.postJawaban(_data, url);

      if (jawaban.status != 'success') {
        notifyListeners();

        return _state = ResultState.error;
      } else {
        notifyListeners();

        return _state = ResultState.success;
      }
    } catch (e) {
      notifyListeners();
      return _state = ResultState.error;
    }
  }

  void createData(
    String idRuangan,
    String j1,
    String j2,
    String j3,
    String j4,
    String j5,
    String j6,
    String j7,
    String j8,
    String j9,
    String j10,
  ) {
    _data = {
      'id_ruangan': idRuangan,
      'jawaban1': j1,
      'jawaban2': j2,
      'jawaban3': j3,
      'jawaban4': j4,
      'jawaban5': j5,
      'jawaban6': j6,
      'jawaban7': j7,
      'jawaban8': j8,
      'jawaban9': j9,
      'jawaban10': j10,
    };
    notifyListeners();
  }
}
