part of 'coin_details_bloc.dart';

@immutable
abstract class CoinDetailsState {
  final CoinDetails? coinDetails;

  const CoinDetailsState(this.coinDetails);
}

class CoinDetailsInitial extends CoinDetailsState {
  const CoinDetailsInitial() : super(null);
}

class CoinDetailsLoading extends CoinDetailsState {
  const CoinDetailsLoading() : super(null);
}

class CoinDetailsLoaded extends CoinDetailsState {
  const CoinDetailsLoaded(CoinDetails coinDetails) : super(coinDetails);
}

class CoinDetailsError extends CoinDetailsState {
  final String error;

  const CoinDetailsError(this.error) : super(null);
}

class CoinDetailsNotFound extends CoinDetailsState {
  const CoinDetailsNotFound() : super(null);
}

class CoinDetailsNotFoundError extends CoinDetailsState {
  final String error;

  const CoinDetailsNotFoundError(this.error) : super(null);
}
