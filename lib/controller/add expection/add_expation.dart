import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

abstract class AddExpation {
  static addReport(
      {required id,
      required money,
      required reason,
      required period,
      required onePeriod,
      required totalComplete}) async {
    FirebaseFirestore.instance.collection("report").add({
      "uID": id,
      "money": money,
      "reason": reason,
      "period": period,
      "onePeriod": onePeriod,
      "totalComplete": totalComplete,
    }).then((value) {
      Get.snackbar("تم", "تم الاضافة بنجاح");

      return value;
    }).catchError((error) => Get.snackbar("خطأ", "حدث خطأ ما حاول مرة اخرى"));
  }
}
