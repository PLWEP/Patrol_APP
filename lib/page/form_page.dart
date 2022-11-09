import 'package:flutter/material.dart';
import 'package:patrol_app/data/api/api_service.dart';
import 'package:patrol_app/data/model/pertanyaan.dart';
import 'package:patrol_app/provider/jawaban_provider.dart';
import 'package:patrol_app/provider/ruangan_provider.dart';
import 'package:patrol_app/util/result_state.dart';
import 'package:patrol_app/widgets/custom_button.dart';
import 'package:patrol_app/widgets/custom_text_form.dart';
import 'package:provider/provider.dart';

class FormPage extends StatelessWidget {
  static const routeName = '/form-page';
  final _formKey = GlobalKey<FormState>();

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RuanganProvider>(
          create: (_) => RuanganProvider(apiService: ApiService(), link: link),
        ),
        ChangeNotifierProvider<JawabanProvider>(
          create: (_) => JawabanProvider(apiService: ApiService()),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: Consumer2<RuanganProvider, JawabanProvider>(
            builder: (context, stateRuangan, stateJawaban, _) {
              if (stateRuangan.state == ResultState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (stateRuangan.state == ResultState.error ||
                  stateRuangan.state == ResultState.noData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 75),
                    Text(
                      stateRuangan.msg,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              } else if (stateRuangan.state == ResultState.hasData &&
                  stateJawaban.state == ResultState.success) {
                return AlertDialog(
                  title: const Text(
                    'Jawaban Tersimpan',
                    textScaleFactor: 1,
                  ),
                  actions: <Widget>[
                    TextButton(
                        child: const Text('Kembali'),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                );
              } else if (stateRuangan.state == ResultState.hasData &&
                  stateJawaban.state != ResultState.success) {
                final DataRuangan dataRuangan = stateRuangan.result.data[0];

                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  child: ListView(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
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
                            CustomButton(
                              child: stateJawaban.state == ResultState.loading
                                  ? const CircularProgressIndicator()
                                  : const Text('Simpan'),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Provider.of<JawabanProvider>(context,
                                          listen: false)
                                      .createData(
                                    dataRuangan.id,
                                    textController1.text,
                                    textController2.text,
                                    textController3.text,
                                    textController4.text,
                                    textController5.text,
                                    textController6.text,
                                    textController7.text,
                                    textController8.text,
                                    textController9.text,
                                    textController10.text,
                                  );
                                  Provider.of<JawabanProvider>(context,
                                          listen: false)
                                      .postJawaban(link);
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              stateJawaban.state == ResultState.error
                                  ? "Terjadi Kesalahan. Coba lagi nanti."
                                  : "",
                              style: const TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
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
