import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import '../../../view/app_bar_buttom/bar_buttom_app.dart';
part 'login_and_regester_state.dart';

class LoginAndRegesterCubit extends Cubit<LoginAndRegesterState> {
  LoginAndRegesterCubit() : super(LoginAndRegesterInitial());

  bool loading = false;

//function login
  login({required String email, required String password}) async {
    loading = true;
    emit(WaitingState());
    Future.delayed(
      const Duration(seconds: 5),
      () {
        emit(WaitingState());
        loading = false;
      },
    );

    ///firebase
    try {
      final value = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await Get.to(
        ButtonBarC(
          uID: value.user!.uid,
        ),
      );
      //
      loading = false;
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      loading = false;
      if (e.code == 'user-not-found') {
        emit(ErrorState(message: "البريد الالكتروني غير صحيح"));
      } else if (e.code == 'wrong-password') {
        emit(ErrorState(message: "الباسورد خاطئ"));
      }
    }
  }

//function create account
  regester(
      {required String email,
      required String password,
      required String name,
      required bool admin,
      required String blance,
      required String person}) async {
    print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    loading = true;
    emit(WaitingState());

    Future.delayed(
      const Duration(seconds: 5),
      () {
        emit(WaitingState());

        loading = false;
      },
    );
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        await FirebaseFirestore.instance.collection("users").add({
          "email": email,
          "name": name,
          "admin": admin,
          "person": person,
          "Uid": value.user!.uid
        });
        await FirebaseFirestore.instance.collection("balance").add({
          "uid": value.user!.uid,
          "balance": blance,
          "remainbalance": blance,
          "withdrawal": 0,
        });
        Get.to(
          ButtonBarC(
            uID: value.user!.uid,
          ),
        );
      });

      loading = false;

      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      loading = false;
      if (e.code == 'weak-password') {
        emit(ErrorState(message: "الباسورد ضعيف"));
      } else if (e.code == 'email-already-in-use') {
        emit(ErrorState(message: "البريد الالكتروني مستخدم بالفعل"));
      }
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
    Future.delayed(
      const Duration(seconds: 3),
      () {
        loading = false;
      },
    );
  }
}
