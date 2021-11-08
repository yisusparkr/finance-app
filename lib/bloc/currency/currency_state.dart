part of 'currency_bloc.dart';

abstract class CurrencyState extends Equatable {
  const CurrencyState();
  
  @override
  List<Object> get props => [];
}

class CurrencyInitial extends CurrencyState {}

class LoadingCurrency extends CurrencyState {}

class CurrencyLoaded extends CurrencyState {
  const CurrencyLoaded(this.currency);

  final Currency currency;

  @override
  List<Object> get props => [currency];
}

class CurrencyError extends CurrencyState {
  const CurrencyError(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
