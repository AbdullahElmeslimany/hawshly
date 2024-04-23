import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_balance_data_state.dart';

class GetBalanceDataCubit extends Cubit<GetBalanceDataState> {
  GetBalanceDataCubit() : super(GetBalanceDataInitial());
  List data = [];
  void getBalanceData({required id}) async {
    FirebaseFirestore.instance
        .collection('balance')
        .where('uid', isEqualTo: id)
        .snapshots()
        .listen((event) {
      data.clear();
      data.addAll(event.docs);
      emit(GetBalanceDataSucess());
    });

    // .get()
    //     .then((value) {
    //   data.addAll(value.docs);
    //   print(data[0]['user']);
    //   emit(GetBalanceDataSucess());
    // });
  }
}
