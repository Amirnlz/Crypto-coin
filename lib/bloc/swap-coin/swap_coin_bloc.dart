import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../models/coin/coin.dart';
import '../../resources/coin_repository.dart';

part 'swap_coin_event.dart';
part 'swap_coin_state.dart';

class SwapCoinBloc extends Bloc<SwapCoinEvent, SwapCoinState> {
  final _repository = CoinRepository();

  SwapCoinBloc() : super(const InitialSwapCoinState()) {
    on<InitializeSwapCoinEvent>(_initialize);
    on<ChangeSourceCoin>(_changeSourceCoin);
    on<DoSwapEvent>(_updateState);
  }

  void _initialize(event, emit) {
    emit(const LoadingSwapCoinState());
  }

  void _changeSourceCoin(event, emit) async {
    Coin coin = await findCoin(event.coinId);
    final price = event.sourceCoinAmount * coin.currentPrice;

    emit(
      UpdateSourceCoinState(
          sourceCoin: coin,
          coinsValue: price,
          sourceAmount: event.sourceCoinAmount),
    );
  }

  void _updateState(event, emit) async {
    emit(const LoadingSwapCoinState());

    Coin targetCoin = await findCoin(event.targetCoinId);
    Coin sourceCoin = await findCoin(event.sourceCoinId);
    final targetAmount = (event.sourceCoinAmount * sourceCoin.currentPrice) /
        targetCoin.currentPrice;
    final coinsValue = event.sourceCoinAmount * sourceCoin.currentPrice;

    emit(UpdateSwapState(
      targetCoin: targetCoin,
      sourceCoin: sourceCoin,
      targetAmount: targetAmount,
      sourceAmount: event.sourceCoinAmount,
      coinsValue: coinsValue,
    ));
  }

  Future<Coin> findCoin(String coinId) async {
    final coinList = await coins;
    return coinList.firstWhere(
      (coin) => coin.id == coinId,
      orElse: () => coinList.first,
    );
  }

  Future<List<Coin>> get coins => _repository.fetchMarketCoin;

  double getTargetAmount(
      double sourceAmount, double sourcePrice, double targetPrice) {
    return sourceAmount * sourcePrice / targetPrice;
  }

  double getTargetPrice(double targetAmount, double targetPrice) {
    return targetAmount * targetPrice;
  }
}
