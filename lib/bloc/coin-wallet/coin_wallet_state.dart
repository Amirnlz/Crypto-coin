part of 'coin_wallet_bloc.dart';

@immutable
abstract class CoinWalletState {
  final List<CoinWallet> coinsWallet;
  final double totalAmount;
  final double totalProfitPercentage;

  const CoinWalletState(
      this.coinsWallet, this.totalAmount, this.totalProfitPercentage);
}

class CoinWalletInitial extends CoinWalletState {
  const CoinWalletInitial() : super(const [], 0, 0);
}

class CoinWalletLoading extends CoinWalletState {
  const CoinWalletLoading() : super(const [], 0, 0);
}

class CoinWalletListLoaded extends CoinWalletState {
  const CoinWalletListLoaded(
      {required List<CoinWallet> coinsWallet,
      double amount = 0,
      double profitPercentage = 0})
      : super(coinsWallet, amount, profitPercentage);
}

class CoinWalletError extends CoinWalletState {
  final String error;

  const CoinWalletError({required this.error}) : super(const [], 0, 0);
}
