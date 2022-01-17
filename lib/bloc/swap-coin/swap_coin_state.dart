part of 'swap_coin_bloc.dart';

@immutable
abstract class SwapCoinState {
  final Coin? sourceCoin;
  final Coin? targetCoin;
  final double sourceAmount;
  final double targetAmount;
  final double coinsValue;

  const SwapCoinState({
    this.sourceCoin,
    this.targetCoin,
    this.sourceAmount = 0,
    this.targetAmount = 0,
    this.coinsValue = 0,
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
      required double coinsValue})
      : super(
            sourceCoin: sourceCoin,
            sourceAmount: sourceAmount,
            coinsValue: coinsValue);
}

class UpdateSwapState extends SwapCoinState {
  const UpdateSwapState(
      {required Coin targetCoin,
      required Coin sourceCoin,
      required double targetAmount,
      required double sourceAmount,
      required double coinsValue})
      : super(
          targetCoin: targetCoin,
          sourceCoin: sourceCoin,
          targetAmount: targetAmount,
          sourceAmount: sourceAmount,
          coinsValue: coinsValue,
        );
}

class ErrorSwapCoinState extends SwapCoinState {
  final String error;

  const ErrorSwapCoinState({
    required this.error,
  }) : super();
}
