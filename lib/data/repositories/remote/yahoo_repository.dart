import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '/constants/contants.dart';
import '/data/models/currency.dart';

class YahooRepository {

  static const _url = 'https://yfapi.net/v8/finance/spark';
  final _dio = Dio();

  Future<Currency?> getCurrency( String name ) async {
    switch (name) {
      case 'Nasdaq':
        name = '%5EIXIC';
        break;
      case 'Nikkei':
        name = '%5EN225';
        break;
      case 'Dax':
        name = '%5EGDAXI';
        break;
      default:
    }

    try {
      final config = await rootBundle.loadString(Constants.config);
      final key = json.decode(config)['yahoo_api_key'];
      final response = await _dio.get(
        _url,
        queryParameters: {
          'interval': '1d',
          'range': '10d',
          'symbols': name
        },
        options: Options(
          headers: {
            'accept': 'application/json',
            'X-API-KEY': key
          }
        )
      );

      final data = Currency.fromJson(response.data[name.replaceAll('%5E', '^')]);
      return data;

    } catch(error) {
      return null;
    }
  }

}