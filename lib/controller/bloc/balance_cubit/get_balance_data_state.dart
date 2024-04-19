part of 'get_balance_data_cubit.dart';

@immutable
sealed class GetBalanceDataState {}

final class GetBalanceDataInitial extends GetBalanceDataState {}

final class GetBalanceDataSucess extends GetBalanceDataState {}
