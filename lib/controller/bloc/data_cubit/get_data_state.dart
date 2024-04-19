part of 'get_data_cubit.dart';

@immutable
sealed class GetDataState {}

final class GetDataInitial extends GetDataState {}

final class SuccessGetDataState extends GetDataState {
  final data;

  SuccessGetDataState({required this.data});
}

final class WaitGetDataState extends GetDataState {}

final class FialdGetDataState extends GetDataState {}
