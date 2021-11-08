import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:finance_app/data/models/rfc.dart';
import 'package:flutter/services.dart' show rootBundle;

import '/constants/contants.dart';

class RfcRepository {
  static const _url = 'https://verifier.p.rapidapi.com/rfc/verify';
  final _dio = Dio();

  Future<bool> validateRfc( String rfc ) async {
    try {
      final config = await rootBundle.loadString(Constants.config);
      final key = json.decode(config)['rfc_api_key'];
      final response = await _dio.post(
        _url,
        data: {
          'rfc': rfc
        },
        options: Options(
          headers: {
            'content-type': 'application/json',
            'x-rapidapi-host': 'verifier.p.rapidapi.com',
            'x-rapidapi-key': key
          }
        )
      );
      final data = RfcResponse.fromJson(response.data);
      if ( data.isValid! ) {
        return true;
      } else {
        return false;
      }
    } catch(error) {
      return false;
    }
  }
}