import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/test.mocks.dart';
import 'package:finance_app/data/models/currency.dart';
import 'package:finance_app/bloc/currency/currency_bloc.dart';


void main() {
  group('CurrencyBloc', () {
    final yahooRepository = MockYahooRepository();
    final currency = Currency(
      close: [],
      symbol: 'symbol',
      timestamp: []
    );
    late CurrencyBloc bloc;

    setUp(() => bloc = CurrencyBloc(yahooRepository));

    tearDownAll(() => bloc.close());

    test('get currency error', () async {
      when(() => yahooRepository.getCurrency(any()))
        .thenAnswer((_) async => null);
      // act
      bloc.add(OnLoadCurrency('symbol'));
      // expect
      await expectLater(bloc.stream, emitsInOrder([
        LoadingCurrency(),
        const CurrencyError('Something went wrong')
      ]));
    });

    test('currency loaded', () async {
      when(() => yahooRepository.getCurrency(any()))
        .thenAnswer((_) async => currency);
      // act
      bloc.add(OnLoadCurrency('symbol'));
      // expect
      await expectLater(bloc.stream, emitsInOrder([
        LoadingCurrency(),
        CurrencyLoaded(currency)
      ]));
    });

  });

}