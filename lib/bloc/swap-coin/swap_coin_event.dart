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

class ChangeTargetCoin extends SwapCoinEvent {
  final String coinId;

  ChangeTargetCoin({required this.coinId});
}
