import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit() : super(GetDataInitial());
  List data = [];

  getData({required id}) async {
    emit(WaitGetDataState());
    var prefs = FirebaseFirestore.instance
        .collection("users")
        .where('Uid', isEqualTo: id);
    QuerySnapshot getdata = await prefs.get();
    data.addAll(getdata.docs);
    emit(SuccessGetDataState(data: data));
  }

  updateProfile({required id, required name, required password}) async {
    FirebaseFirestore.instance.collection("users").doc(id).update({
      "name": name,
    });
    print("object-----------------------------------");
    if (password != '') {
      final user = FirebaseAuth.instance.currentUser;
      await user?.updatePassword(password);
      Get.snackbar("تم التعديل بنجاح", "");
    }
  }
}
