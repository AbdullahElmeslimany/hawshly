import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_value_state.dart';

class ChangeValueCubit extends Cubit<ChangeValueState> {
  ChangeValueCubit() : super(ChangeValueInitial());
  int valuePrice = 0;
  calculation({required int value, required String typeMonth}) {
    print("Calcultaion---------------------------------------------------");
    print(value.runtimeType);
    print((value / 6).round());
    if (typeMonth == '6 شهور') {
      valuePrice = (value / 6).round();
      emit(SuccessChangeState(valuePrice));
    } else if (typeMonth == '12 شهر') {
      valuePrice = (value / 12).round();
      emit(SuccessChangeState(valuePrice));
    } else if (typeMonth == '24 شهر') {
      valuePrice = (value / 24).round();
      emit(SuccessChangeState(valuePrice));
    }
  }
}
