part of 'supported_coin_bloc.dart';

@immutable
abstract class SupportedCoinListState {
  final List<SupportedCoin> supportedCoin;

  const SupportedCoinListState(this.supportedCoin);
}

class SupportedCoinInitial extends SupportedCoinListState {
  const SupportedCoinInitial() : super(const []);
}

class SupportedCoinLoading extends SupportedCoinListState {
  const SupportedCoinLoading() : super(const []);
}

class SupportedCoinLoaded extends SupportedCoinListState {
  const SupportedCoinLoaded({required List<SupportedCoin> supportedCoin})
      : super(supportedCoin);
}

class SupportedCoinError extends SupportedCoinListState {
  final String message;
  const SupportedCoinError({required this.message}) : super(const []);
}
