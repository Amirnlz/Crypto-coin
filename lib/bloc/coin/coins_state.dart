part of 'coins_bloc.dart';

@immutable
abstract class CoinListState {
  final List<Coin> coinList;
  const CoinListState(this.coinList);
}

class CoinListInitial extends CoinListState {
  const CoinListInitial() : super(const []);
}

class CoinListLoading extends CoinListState {
  const CoinListLoading() : super(const []);
}

class CoinListLoaded extends CoinListState {
  const CoinListLoaded(List<Coin> coins) : super(coins);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoinListLoaded && listEquals(other.coinList, coinList);
  }

  @override
  int get hashCode => coinList.hashCode;
}

class CoinListError extends CoinListState {
  final String error;
  const CoinListError({required this.error}) : super(const []);
  String get message => error;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoinListError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
