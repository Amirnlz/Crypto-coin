part of 'coin_wallet_bloc.dart';

@immutable
abstract class CoinWalletEvent {}

class GetCoinWallet extends CoinWalletEvent {
  final List<CoinWallet> coinWalletList;
  GetCoinWallet({this.coinWalletList = const []});
}

class AddCoinToWallet extends CoinWalletEvent {
  final String coinId;
  final double amount;
  final List<CoinWallet> coinWalletList;

  AddCoinToWallet({
    required this.coinId,
    required this.amount,
    this.coinWalletList = const [],
  });
}

class RemoveCoinFromWallet extends CoinWalletEvent {}

class ChangeAmountOfCoinWallet extends CoinWalletEvent {
  final CoinWallet coin;
  final double newAmount;

  ChangeAmountOfCoinWallet({required this.coin, required this.newAmount});
}
