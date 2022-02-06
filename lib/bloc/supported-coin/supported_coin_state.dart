part of 'supported_coin_bloc.dart';

@immutable
abstract class SupportedCoinListState extends Equatable {
  final List<SupportedCoin> supportedCoin;

  const SupportedCoinListState(this.supportedCoin);
}

class SupportedCoinInitial extends SupportedCoinListState {
  const SupportedCoinInitial() : super(const []);

  @override
  List<Object?> get props => [supportedCoin];
}

class SupportedCoinLoading extends SupportedCoinListState {
  const SupportedCoinLoading() : super(const []);

  @override
  List<Object?> get props => [supportedCoin];
}

class SupportedCoinLoaded extends SupportedCoinListState {
  const SupportedCoinLoaded({required List<SupportedCoin> supportedCoin})
      : super(supportedCoin);

  @override
  List<Object?> get props => [supportedCoin];
}

class SupportedCoinError extends SupportedCoinListState {
  final String message;
  const SupportedCoinError({required this.message}) : super(const []);

  @override
  List<Object?> get props => [supportedCoin];
}
