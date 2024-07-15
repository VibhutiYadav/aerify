import 'package:airline_app/util/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'localization/language.dart';
import 'localization/language_en.dart';

//Region GlobalVariables
BaseLanguage language = LanguagesEn();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aerify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.pages, // Use the routes from the AppRoutes class
    );
  }
}
