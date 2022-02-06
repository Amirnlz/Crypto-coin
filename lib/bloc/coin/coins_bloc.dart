import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../models/coin/coin.dart';
import '../../resources/coin_repository.dart';

part 'coins_event.dart';
part 'coins_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinListState> {
  final _repoitory = CoinRepository();

  CoinBloc() : super(const CoinListInitial()) {
    on<GetMarketCoin>(_getMarketCoin);
  }

  void _getMarketCoin(event, emit) async {
    emit(const CoinListLoading());
    try {
      await _repoitory.fetchMarketCoin.then((coins) {
        emit(CoinListLoaded(coins));
      });
    } catch (e) {
      emit(
          const CoinListError(error: 'Please check your internet connection!'));
    }
  }
}
