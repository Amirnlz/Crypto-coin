import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../models/coin.dart';
import '../../resources/coin_repository.dart';

part 'coins_event.dart';
part 'coins_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  final _repoitory = CoinRepository();

  CoinsBloc() : super(const CoinsInitial()) {
    on<CoinsEvent>((event, emit) async {
      print(event);
      if (event is GetMarketCoins) {
        emit(const CoinsLoading());
        try {
          await _repoitory.fetchMarketCoins().then((coins) {
            emit(CoinsLoaded(coins));
          });
        } catch (e) {
          emit(CoinsError(error: e.toString()));
        }
      }
    });
  }
}
