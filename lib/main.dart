import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:instructor_dairy/repositories/cripto_coins/abstact_coins_repo.dart';
import 'package:instructor_dairy/repositories/cripto_coins/cripto_coins_repository.dart';
import 'app.dart';

void main() {
  /// по интерфейсу регистрируем реализацю конкретного сигнлтона в DI
  GetIt.I.registerLazySingleton<AbstractCoinsRepo>(
          () => CryptoCoinsRepository(dio: Dio())
  );
  runApp(const UsersApp());
}
