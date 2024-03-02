// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// part 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(AuthInitial());

//   List data = [];
//   addAuth({required email, required password}) async {
//     emit(WaitCreateAuthState());
//     try {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       String uid = FirebaseAuth.instance.currentUser!.uid;
//       print(uid);
//       emit(SuccessCreateAuthState());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         emit(FialdCreateAuthState(massage: "user-not-found"));
//       } else if (e.code == 'wrong-password') {
//         emit(FialdCreateAuthState(massage: 'wrong-password'));
//       }
//       emit(FialdCreateAuthState(massage: 'wrong'));
//     }
//   }

//   login({email, password}) async {
//     emit(WaitloginAuthState());
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       emit(SuccessloginAuthState());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         emit(FialdloginAuthState(massage: "user-not-found"));
//       } else if (e.code == 'wrong-password') {
//         emit(FialdloginAuthState(massage: 'wrong-password'));
//       }
//     }
//   }
// }
