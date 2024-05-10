import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import '../../../view/categores/categorises.dart';
part 'trans_state.dart';

class TransCubit extends Cubit<TransState> {
  TransCubit() : super(TransInitial());
  List data = [];
  getData({required id}) async {
    emit(WaitGetDataState());

    FirebaseFirestore.instance
        .collection("trans")
        .where('id', isEqualTo: id)
        .snapshots()
        .listen((event) {
      data.clear();
      data.addAll(event.docs);
    });

    emit(SuccessGetDataState(data: data));
  }

  addTrans(
      {required id,
      required money,
      required reason,
      required note,
      required data,
      required date}) async {
    var price = int.parse(money);
    print(data[0]["uid"]);
    print(data[0]["remainbalance"]);
    print(data[0]["withdrawal"] - price);
    print(data[0].id);
    if (categoreis == null) {
    } else if (categoreis == "الراتب" ||
        categoreis == "المكافآت" ||
        categoreis == "الإضافي" ||
        categoreis == "المبيعات" ||
        categoreis == "أخرى") {
      FirebaseFirestore.instance.collection('trans').add({
        "id": id,
        "money": money,
        "reason": reason,
        "note": note,
        "date": date,
      }).then((value) {
        FirebaseFirestore.instance
            .collection('balance')
            .doc(data[0].id)
            .update({
          "remainbalance": data[0]["remainbalance"] + price,
          // "withdrawal": data[0]["withdrawal"] - price,
          "balance": data[0]["balance"] + price,
        });
        Get.defaultDialog(title: 'تمت اضافة المعاملة بنجاح', content: Text(""));
      });
    } else {
      FirebaseFirestore.instance.collection('trans').add({
        "id": id,
        "money": money,
        "reason": reason,
        "note": note,
        "date": date,
      }).then((value) {
        FirebaseFirestore.instance
            .collection('balance')
            .doc(data[0].id)
            .update({
          "remainbalance": data[0]["remainbalance"] - price,
          "withdrawal": data[0]["withdrawal"] + price,
        });
        Get.defaultDialog(title: 'تمت اضافة المعاملة بنجاح', content: Text(""));
      });
    }
  }
}
