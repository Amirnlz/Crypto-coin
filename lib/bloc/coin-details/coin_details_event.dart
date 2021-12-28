part of 'coin_details_bloc.dart';

@immutable
abstract class CoinDetailsEvent {}

class GetCoinDetailsById extends CoinDetailsEvent {
  final String id;

  GetCoinDetailsById({required this.id});
}
