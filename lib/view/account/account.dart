import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hawshly/model/text_field/text_field.dart';

import '../../controller/bloc/data_cubit/get_data_cubit.dart';

class AccountPage extends StatelessWidget {
  final id;
  const AccountPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<GetDataCubit>(context);
    cubit.getData(id: id);
    TextEditingController nameController = TextEditingController(text: "");
    TextEditingController emailController = TextEditingController(text: "");
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الحساب",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: BlocListener<GetDataCubit, GetDataState>(
            listener: (context, state) {
              if (state is WaitGetDataState) {}
              if (state is SuccessGetDataState) {
                nameController.text = state.data[0]['name'];
                emailController.text = state.data[0]['email'];
              }
            },
            child: Column(
              children: [
                const Gap(20),
                textFromFieldcustom(
                    width: MediaQuery.sizeOf(context).width - 30,
                    onTap: () {},
                    controller: nameController,
                    text: "الاسم"),
                const Gap(20),
                textFromFieldcustom(
                    width: MediaQuery.sizeOf(context).width - 30,
                    onTap: () {},
                    controller: emailController,
                    text: "البريد الالكتروني"),
                const Gap(20),
                textFromFieldcustom(
                    width: MediaQuery.sizeOf(context).width - 30,
                    onTap: () {},
                    controller: passwordController,
                    text: "الرقم السري"),
                const Gap(20),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(229, 0, 110, 99),
                      borderRadius: BorderRadius.circular(15)),
                  child: MaterialButton(
                    onPressed: () {
                      cubit.updateProfile(
                          id: id,
                          name: nameController.text,
                          password: passwordController.text);
                    },
                    child: const Text(
                      "تعديل",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
