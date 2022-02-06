part of 'coin_wallet_bloc.dart';

@immutable
abstract class CoinWalletState extends Equatable {
  final List<CoinWallet> coinsWallet;
  final double amount;
  final double profitPercentage;

  const CoinWalletState(this.coinsWallet, this.amount, this.profitPercentage);
}

class CoinWalletInitial extends CoinWalletState {
  const CoinWalletInitial() : super(const [], 0, 0);

  @override
  List<Object?> get props => [coinsWallet, amount, profitPercentage];
}

class CoinWalletLoading extends CoinWalletState {
  const CoinWalletLoading() : super(const [], 0, 0);

  @override
  List<Object?> get props => [coinsWallet, amount, profitPercentage];
}

class CoinWalletListLoaded extends CoinWalletState {
  const CoinWalletListLoaded(
      {required List<CoinWallet> coinsWallet,
      double amount = 0,
      double profitPercentage = 0})
      : super(coinsWallet, amount, profitPercentage);

  @override
  List<Object?> get props => [coinsWallet, amount, profitPercentage];
}

class CoinWalletError extends CoinWalletState {
  final String error;

  const CoinWalletError({required this.error}) : super(const [], 0, 0);

  @override
  List<Object?> get props => [coinsWallet, amount, profitPercentage];
}
