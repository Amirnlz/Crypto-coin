part of 'coins_bloc.dart';

@immutable
abstract class CoinsState {
  final List<Coin> coins;
  const CoinsState(this.coins);
}

class CoinsInitial extends CoinsState {
  const CoinsInitial() : super(const []);
}

class CoinsLoading extends CoinsState {
  const CoinsLoading() : super(const []);
}

class CoinsLoaded extends CoinsState {
  const CoinsLoaded(List<Coin> coins) : super(coins);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoinsLoaded && listEquals(other.coins, coins);
  }

  @override
  int get hashCode => coins.hashCode;
}

class CoinsError extends CoinsState {
  final String error;
  const CoinsError({required this.error}) : super(const []);
  String get message => error;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoinsError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
