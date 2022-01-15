import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../models/coin/coin.dart';
import '../../resources/coin_repository.dart';

part 'coins_event.dart';
part 'coins_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinListState> {
  final _repoitory = CoinRepository();

  CoinBloc() : super(const CoinListInitial()) {
    on<CoinEvent>((event, emit) async {
      if (event is GetMarketCoin) {
        emit(const CoinListLoading());
        try {
          await _repoitory.fetchMarketCoin.then((coins) {
            emit(CoinListLoaded(coins));
          });
        } catch (e) {
          emit(const CoinListError(
              error: 'Please check your internet connection!'));
        }
      }
    });
  }
}
