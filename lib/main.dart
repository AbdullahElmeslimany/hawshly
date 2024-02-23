import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawshly/controller/bloc/auth_cubit/auth_cubit.dart';
import 'package:hawshly/controller/bloc/data_cubit/get_data_cubit.dart';
import 'package:hawshly/firebase_options.dart';
import 'package:hawshly/model/constant_basic.dart';
import 'package:hawshly/view/homepage/homepage.dart';
import 'package:hawshly/view/loginandsignup/loginpage.dart';
import 'package:hawshly/view/otpscreen/otppage.dart';
import 'package:hawshly/view/sendmoney/sendmoney.dart';
import 'package:hawshly/view/testd/datapage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
          BlocProvider(
            create: (context) => GetDataCubit(),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hawshly',
          // themeMode: ThemeMode.dark,
          // darkTheme: ThemeData(
          //   brightness: Brightness.dark,
          // ),

          theme: ThemeData(
              scaffoldBackgroundColor: backgroundColors,
              colorScheme: ColorScheme.fromSeed(seedColor: textColors),
              useMaterial3: true,
              textTheme: TextTheme(
                bodyMedium: GoogleFonts.alexandria(color: textColors),
              )),
          home: const MyHomePage(),
        ));
  }
}
