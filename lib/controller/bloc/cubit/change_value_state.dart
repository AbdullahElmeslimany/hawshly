part of 'change_value_cubit.dart';

@immutable
sealed class ChangeValueState {}

final class ChangeValueInitial extends ChangeValueState {}

final class SuccessChangeState extends ChangeValueState {
  final value;

  SuccessChangeState(this.value);
}
