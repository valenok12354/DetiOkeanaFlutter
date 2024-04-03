import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instructor_dairy/repositories/cripto_coins/abstact_coins_repo.dart';
import 'package:meta/meta.dart';

import '../../repositories/cripto_coins/models/crypto_coin.dart';
part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc(this.repo) : super(ListInitial()) {
    on<LoadList>((event, emit) async {
      try {
        if (state is! ListLoaded) {
          emit(ListLoading());
        }
        final coinsList = await repo.getCoinsList();
        emit(ListLoaded(coinsList: coinsList));
      } catch (e) {
        emit(ListLoadingFailure(exception: e));
      }
      finally {
        event.completer?.complete();
      }
    });
  }
  final AbstractCoinsRepo repo;
}
