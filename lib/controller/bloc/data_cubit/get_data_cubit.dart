// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:meta/meta.dart';

// part 'get_data_state.dart';

// class GetDataCubit extends Cubit<GetDataState> {
//   GetDataCubit() : super(GetDataInitial());
//   List data = [];
//   getData() async {
//     emit(WaitGetDataState());

//     CollectionReference prefs = FirebaseFirestore.instance.collection("user");
//     QuerySnapshot getdata = await prefs.get();
//     data.addAll(getdata.docs);

//     emit(SuccessGetDataState());
//   }
// }
