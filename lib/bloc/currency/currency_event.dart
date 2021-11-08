part of 'currency_bloc.dart';

abstract class CurrencyEvent {}

class OnLoadCurrency extends CurrencyEvent {
  OnLoadCurrency(this.name);
  final String name;
}
