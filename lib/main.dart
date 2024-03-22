import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:instructor_dairy/repositories/cripto_coins/abstact_coins_repo.dart';
import 'package:instructor_dairy/repositories/cripto_coins/cripto_coins_repository.dart';
import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  /// по интерфейсу регистрируем реализацю конкретного сигнлтона в DI
  GetIt.I.registerLazySingleton<AbstractCoinsRepo>(
          () => CryptoCoinsRepository(dio: Dio())
  );
  runApp(const UsersApp());
}
