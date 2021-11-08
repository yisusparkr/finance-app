import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/data/models/currency.dart';
import '/data/repositories/remote/yahoo_repository.dart';

part 'currency_event.dart';
part 'currency_state.dart';

/*
  [CurrencyBloc] is a class that help us to
  manage the state when the user try to
  request the currency data, contacting with [YahooRepository],
  depending of the repository response it
  updates the state.
*/
class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {

  final YahooRepository _yahooRepository;

  CurrencyBloc(
    this._yahooRepository
  ) : super(CurrencyInitial()) {
    on<OnLoadCurrency>(_onLoadCurrency);
  }

  void _onLoadCurrency( OnLoadCurrency event, Emitter emit ) async {
    emit(LoadingCurrency());
    final currency = await _yahooRepository.getCurrency(event.name);
    if ( currency != null ) {
      return emit(CurrencyLoaded(currency));
    } else {
      return emit(const CurrencyError('Something went wrong'));
    }
  }

}
