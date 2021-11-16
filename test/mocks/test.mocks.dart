import 'package:mocktail/mocktail.dart';

import 'package:finance_app/data/repositories/remote/rfc_repository.dart';
import 'package:finance_app/data/repositories/remote/auth_repository.dart';
import 'package:finance_app/data/repositories/remote/yahoo_repository.dart';
import 'package:finance_app/data/repositories/remote/firestore_repository.dart';

/* 
  [MockAuthRepository] is used as an implementation
  of AuthRepository
*/
class MockAuthRepository extends Mock implements AuthRepository {}
/* 
  [MockFirestoreRepository] is used as an implementation
  of FirestoreRepository
*/
class MockFirestoreRepository extends Mock implements FirestoreRepository {}
/* 
  [MockRfcRepository] is used as an implementation
  of RfcRepository
*/
class MockRfcRepository extends Mock implements RfcRepository {}
/* 
  [MockYahooRepository] is used as an implementation
  of YahooRepository
*/
class MockYahooRepository extends Mock implements YahooRepository {}