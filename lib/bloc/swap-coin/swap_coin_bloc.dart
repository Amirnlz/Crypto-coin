import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/coin/coin.dart';
import '../../resources/coin_repository.dart';

part 'swap_coin_event.dart';
part 'swap_coin_state.dart';

class SwapCoinBloc extends Bloc<SwapCoinEvent, SwapCoinState> {
  final _repository = CoinRepository();

  SwapCoinBloc() : super(const InitialSwapCoinState()) {
    on<InitializeSwapCoinEvent>(_initialize);
    on<ChangeSourceCoin>(_changeSourceCoin);
    on<ChangeTargetCoin>(_changeTargetCoin);
  }

  void _initialize(event, emit) {
    emit(const LoadingSwapCoinState());
  }

  void _changeSourceCoin(event, emit) async {
    final coin = await findCoin(event.coinId);
    final price = event.sourceCoinAmount * coin.currentPrice;

    emit(
      UpdateSourceCoinState(
          sourceCoin: coin,
          sourcePrice: price,
          sourceAmount: event.sourceCoinAmount),
    );
  }

  void _changeTargetCoin(event, emit) async {
    final coin = await findCoin(event.coinId);
    final price = state.sourcePrice;
    final amount = price / coin.currentPrice;

    emit(
      UpdateTargetCoinState(
          targetCoin: coin, targetPrice: price, targetAmount: amount),
    );
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
