part of 'trans_cubit.dart';

@immutable
sealed class TransState {}

final class TransInitial extends TransState {}

final class WaitGetDataState extends TransState {}

final class SuccessGetDataState extends TransState {
  final data;

  SuccessGetDataState({required this.data});
}
