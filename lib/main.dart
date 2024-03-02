import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view/app_bar_buttom/bar_buttom_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hawshly',
      // themeMode: ThemeMode.dark,
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      // ),

      theme: ThemeData(
          // scaffoldBackgroundColor: backgroundColors,
          // colorScheme: ColorScheme.fromSeed(seedColor: textColors),
          useMaterial3: true,
          textTheme: TextTheme(
              bodyLarge: GoogleFonts.alexandria(),
              bodyMedium: GoogleFonts.alexandria(),
              bodySmall: GoogleFonts.alexandria())),
      home: const ButtonBarC(),
    );
  }
}
