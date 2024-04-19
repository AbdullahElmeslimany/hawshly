import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_balance_data_state.dart';

class GetBalanceDataCubit extends Cubit<GetBalanceDataState> {
  GetBalanceDataCubit() : super(GetBalanceDataInitial());
  List data = [];
  void getBalanceData() async {
    FirebaseFirestore.instance
        .collection('balance')
        .where('uid', isEqualTo: 'a')
        .get()
        .then((value) {
      data.addAll(value.docs);
      print(data[0]['user']);
      emit(GetBalanceDataSucess());
    });
  }
}
