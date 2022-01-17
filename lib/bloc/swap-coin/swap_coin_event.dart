part of 'swap_coin_bloc.dart';

@immutable
abstract class SwapCoinEvent {}

class SwapCoinEventFetch extends SwapCoinEvent {
  SwapCoinEventFetch();
}

class InitializeSwapCoinEvent extends SwapCoinEvent {}

class ChangeSourceCoin extends SwapCoinEvent {
  final String coinId;
  final double sourceCoinAmount;

  ChangeSourceCoin({required this.coinId, required this.sourceCoinAmount});
}

class DoSwapEvent extends SwapCoinEvent {
  final String sourceCoinId;
  final String targetCoinId;
  final double sourceCoinAmount;

  DoSwapEvent({
    required this.sourceCoinId,
    required this.targetCoinId,
    required this.sourceCoinAmount,
  });
}
