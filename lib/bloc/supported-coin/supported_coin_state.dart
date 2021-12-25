part of 'supported_coin_bloc.dart';

@immutable
abstract class SupportedCoinState {
  final List<SupportedCoin> supportedCoins;

  const SupportedCoinState(this.supportedCoins);
}

class SupportedCoinInitial extends SupportedCoinState {
  const SupportedCoinInitial() : super(const []);
}

class SupportedCoinLoading extends SupportedCoinState {
  const SupportedCoinLoading() : super(const []);
}

class SupportedCoinLoaded extends SupportedCoinState {
  const SupportedCoinLoaded({required List<SupportedCoin> supportedCoins})
      : super(supportedCoins);
}

class SupportedCoinError extends SupportedCoinState {
  final String message;
  const SupportedCoinError({required this.message}) : super(const []);
}
