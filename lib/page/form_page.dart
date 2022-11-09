import 'package:flutter/material.dart';
import 'package:patrol_app/data/api/api_service.dart';
import 'package:patrol_app/data/model/pertanyaan.dart';
import 'package:patrol_app/provider/ruangan_provider.dart';
import 'package:patrol_app/util/result_state.dart';
import 'package:patrol_app/widgets/custom_text_form.dart';
import 'package:provider/provider.dart';

class FormPage extends StatelessWidget {
  static const routeName = '/form-page';

  final TextEditingController textController1 = TextEditingController(text: '');
  final TextEditingController textController2 = TextEditingController(text: '');
  final TextEditingController textController3 = TextEditingController(text: '');
  final TextEditingController textController4 = TextEditingController(text: '');
  final TextEditingController textController5 = TextEditingController(text: '');
  final TextEditingController textController6 = TextEditingController(text: '');
  final TextEditingController textController7 = TextEditingController(text: '');
  final TextEditingController textController8 = TextEditingController(text: '');
  final TextEditingController textController9 = TextEditingController(text: '');
  final TextEditingController textController10 =
      TextEditingController(text: '');

  final String link;

  FormPage({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RuanganProvider>(
      create: (_) => RuanganProvider(apiService: ApiService(), link: link),
      child: SafeArea(
        child: Scaffold(
          body: Consumer<RuanganProvider>(
            builder: (context, state, _) {
              if (state.state == ResultState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.state == ResultState.error ||
                  state.state == ResultState.noData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 75),
                    Text(
                      state.msg,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              } else if (state.state == ResultState.hasData) {
                final DataRuangan dataRuangan = state.result.data[0];

                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          dataRuangan.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      CustomTextForm(
                        controller: textController1,
                        title: dataRuangan.pertanyaan1,
                      ),
                      CustomTextForm(
                        controller: textController2,
                        title: dataRuangan.pertanyaan2,
                      ),
                      CustomTextForm(
                        controller: textController3,
                        title: dataRuangan.pertanyaan3,
                      ),
                      CustomTextForm(
                        controller: textController4,
                        title: dataRuangan.pertanyaan4,
                      ),
                      CustomTextForm(
                        controller: textController5,
                        title: dataRuangan.pertanyaan5,
                      ),
                      CustomTextForm(
                        controller: textController6,
                        title: dataRuangan.pertanyaan6,
                      ),
                      CustomTextForm(
                        controller: textController7,
                        title: dataRuangan.pertanyaan7,
                      ),
                      CustomTextForm(
                        controller: textController8,
                        title: dataRuangan.pertanyaan8,
                      ),
                      CustomTextForm(
                        controller: textController9,
                        title: dataRuangan.pertanyaan9,
                      ),
                      CustomTextForm(
                        controller: textController10,
                        title: dataRuangan.pertanyaan10,
                      ),
                    ],
                  ),
                );
              } else {
                return const Material(child: Text('Terjadi Kesalahan'));
              }
            },
          ),
        ),
      ),
    );
  }
}
