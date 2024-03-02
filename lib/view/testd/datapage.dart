// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hawshly/controller/bloc/data_cubit/get_data_cubit.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class DataPage extends StatelessWidget {
//   const DataPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     bool active = true;
//     return BlocConsumer<GetDataCubit, GetDataState>(
//       listener: (context, state) {
//         if (state is WaitGetDataState) {}
//         if (state is WaitGetDataState) {
//           active = false;
//         }
//       },
//       builder: (context, state) {
//         BlocProvider.of<GetDataCubit>(context).getData();
//         return Scaffold(
//           body: ModalProgressHUD(inAsyncCall: active, child: Text("data")),
//         );
//       },
//     );
//   }
// }
