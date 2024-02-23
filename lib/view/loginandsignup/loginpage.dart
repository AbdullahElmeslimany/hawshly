import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hawshly/controller/bloc/auth_cubit/auth_cubit.dart';
import 'package:hawshly/controller/cloud_controller.dart';
import 'package:hawshly/view/loginandsignup/homepagelogin.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool active = false;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessloginAuthState) {
          active = false;
          print(state);
          Get.to(SuccessPage());
        }
        if (state is WaitloginAuthState) {
          print(state);
          active = true;
        }
        if (state is FialdloginAuthState) {
          print(state);
          active = false;
          print(state.massage);
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: ModalProgressHUD(
                inAsyncCall: active,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(controller: email),
                    TextFormField(controller: password),
                    MaterialButton(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context)
                            .login(email: email.text, password: password.text);
                      },
                      child: const Text("data"),
                    )
                  ],
                )));
      },
    );
  }
}
