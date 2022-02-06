part of 'coin_details_bloc.dart';

@immutable
abstract class CoinDetailsState extends Equatable {
  final CoinDetails? coinDetails;

  const CoinDetailsState(this.coinDetails);
}

class CoinDetailsInitial extends CoinDetailsState {
  const CoinDetailsInitial() : super(null);

  @override
  List<Object?> get props => [coinDetails];
}

class CoinDetailsLoading extends CoinDetailsState {
  const CoinDetailsLoading() : super(null);

  @override
  List<Object?> get props => [coinDetails];
}

class CoinDetailsLoaded extends CoinDetailsState {
  const CoinDetailsLoaded(CoinDetails coinDetails) : super(coinDetails);
  @override
  List<Object?> get props => [coinDetails];
}

class CoinDetailsError extends CoinDetailsState {
  final String error;

  const CoinDetailsError(this.error) : super(null);
  @override
  List<Object?> get props => [coinDetails];
}
