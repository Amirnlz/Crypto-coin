part of 'coins_bloc.dart';

@immutable
abstract class CoinListState extends Equatable {
  final List<Coin> coinList;
  const CoinListState(this.coinList);
}

class CoinListInitial extends CoinListState {
  const CoinListInitial() : super(const []);

  @override
  List<Object?> get props => [coinList];
}

class CoinListLoading extends CoinListState {
  const CoinListLoading() : super(const []);

  @override
  List<Object?> get props => [coinList];
}

class CoinListLoaded extends CoinListState {
  final List<Coin> coins = const [];
  const CoinListLoaded(coins) : super(coins);

  @override
  List<Object?> get props => [coins];
}

class CoinListError extends CoinListState {
  final String error;
  const CoinListError({required this.error}) : super(const []);
  String get message => error;

  @override
  List<Object?> get props => [coinList];
}
