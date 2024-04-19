import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'trans_state.dart';

class TransCubit extends Cubit<TransState> {
  TransCubit() : super(TransInitial());
  List data = [];
  getData({required id}) async {
    emit(WaitGetDataState());

    QuerySnapshot getdata = await FirebaseFirestore.instance
        .collection("trans")
        .where('name', isEqualTo: "11")
        .get();
    data.addAll(getdata.docs);
    emit(SuccessGetDataState(data: data));
  }

  addTrans(
      {required id,
      required name,
      required reason,
      required note,
      required date}) async {
    FirebaseFirestore.instance.collection('trans').add({
      "id": id,
      "money": name,
      "reason": reason,
      "note": note,
      "date": date,
    }).then((value) {
      Get.defaultDialog(title: 'تمت اضافة المعاملة بنجاح');
    });
  }
}
