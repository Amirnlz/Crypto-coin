part of 'coins_bloc.dart';

@immutable
abstract class CoinsEvent {}

class GetMarketCoins extends CoinsEvent {}

class GetSupportedCoins extends CoinsEvent {}
