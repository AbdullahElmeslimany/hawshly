import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawshly/view/food/food.dart';
import 'package:hawshly/view/loginandsignup/loginpage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'controller/bloc/balance_cubit/get_balance_data_cubit.dart';
import 'controller/bloc/cubit/change_value_cubit.dart';
import 'controller/bloc/data_cubit/get_data_cubit.dart';
import 'controller/bloc/login_regester_cubit/login_and_regester_cubit.dart';
import 'controller/bloc/trans_cubit/trans_cubit.dart';

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
          create: (context) => LoginAndRegesterCubit(),
        ),
        BlocProvider(
          create: (context) => GetDataCubit(),
        ),
        BlocProvider(
          create: (context) => TransCubit(),
        ),
        BlocProvider(
          create: (context) => GetBalanceDataCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeValueCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'حوشلي',
        theme: ThemeData(
          useMaterial3: true,
          textTheme: TextTheme(
            bodyLarge: GoogleFonts.alexandria(),
            bodyMedium: GoogleFonts.alexandria(),
            bodySmall: GoogleFonts.alexandria(),
          ),
        ),
        // home: FoodPage(
        //   person: 3,
        // ),
        home: const LoginPage(),
      ),
    );
  }
}
