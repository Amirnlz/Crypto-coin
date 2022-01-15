part of 'swap_coin_bloc.dart';

@immutable
abstract class SwapCoinState {
  final Coin? sourceCoin;
  final Coin? targetCoin;
  final double sourceAmount;
  final double targetAmount;
  final double sourcePrice;

  final double targetPrice;

  const SwapCoinState({
    this.sourceCoin,
    this.targetCoin,
    this.sourceAmount = 0,
    this.targetAmount = 0,
    this.sourcePrice = 0,
    this.targetPrice = 0,
  });
}

class InitialSwapCoinState extends SwapCoinState {
  const InitialSwapCoinState() : super();
}

class LoadingSwapCoinState extends SwapCoinState {
  const LoadingSwapCoinState() : super();
}

class UpdateSourceCoinState extends SwapCoinState {
  const UpdateSourceCoinState(
      {required Coin sourceCoin,
      required double sourceAmount,
      required double sourcePrice})
      : super(
            sourceCoin: sourceCoin,
            sourceAmount: sourceAmount,
            sourcePrice: sourcePrice);
}

class UpdateTargetCoinState extends SwapCoinState {
  const UpdateTargetCoinState(
      {required Coin targetCoin,
      required double targetAmount,
      required double targetPrice})
      : super(
            targetCoin: targetCoin,
            targetAmount: targetAmount,
            targetPrice: targetPrice);
}

class ErrorSwapCoinState extends SwapCoinState {
  final String error;

  const ErrorSwapCoinState({
    required this.error,
  }) : super();
}
