part of 'coin_wallet_bloc.dart';

@immutable
abstract class CoinWalletState {
  final List<CoinWallet> coinsWallet;

  const CoinWalletState(this.coinsWallet);
}

class CoinWalletInitial extends CoinWalletState {
  const CoinWalletInitial() : super(const []);
}

class CoinWalletLoading extends CoinWalletState {
  const CoinWalletLoading() : super(const []);
}

class CoinWalletLoaded extends CoinWalletState {
  const CoinWalletLoaded({required List<CoinWallet> coinsWallet})
      : super(coinsWallet);
}

class CoinWalletError extends CoinWalletState {
  final String error;

  const CoinWalletError({required this.error}) : super(const []);
}
