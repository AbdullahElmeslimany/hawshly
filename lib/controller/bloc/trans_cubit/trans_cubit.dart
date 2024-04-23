import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
    FirebaseFirestore.instance.collection('trans').add({
      "id": id,
      "money": money,
      "reason": reason,
      "note": note,
      "date": date,
    }).then((value) {
      FirebaseFirestore.instance.collection('balance').doc(data[0].id).update({
        "remainbalance": data[0]["remainbalance"] - price,
        "withdrawal": data[0]["withdrawal"] + price,
      });
      Get.defaultDialog(title: 'تمت اضافة المعاملة بنجاح', content: Text(""));
    });
  }
}
