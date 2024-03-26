import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawshly/view/loginandsignup/loginpage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'view/app_bar_buttom/bar_buttom_app.dart';

Box? myBox;

Future<Box> openFile(String boxname) async {
  if (!Hive.isBoxOpen(boxname)) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }
  return await Hive.openBox(boxname);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  myBox = await openFile("Hawshly");
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'حوشلي',
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
      // home: const ButtonBarC(),
      home: const LoginPage(),
    );
  }
}
