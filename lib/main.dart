import 'package:flutter/material.dart';
import 'package:patrol_app/page/form_page.dart';
import 'package:patrol_app/page/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patrol APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        FormPage.routeName: (context) => FormPage(
              link: ModalRoute.of(context)?.settings.arguments as String,
            ),
        HomePage.routeName: (context) => const HomePage(),
      },
    );
  }
}
