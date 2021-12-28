// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:bloc/bloc.dart';
import 'package:crypto_coin/resources/coin_repository.dart';
import 'package:meta/meta.dart';

import '../../models/wallet/coin_wallet.dart';

part 'coin_wallet_event.dart';
part 'coin_wallet_state.dart';

class CoinWalletBloc extends Bloc<CoinWalletEvent, CoinWalletState> {
  final _repository = CoinRepository();

  CoinWalletBloc() : super(const CoinWalletInitial()) {
    on<CoinWalletEvent>((event, emit) async {
      print(event);

      if (event is GetWalletCoin) {
        emit(CoinWalletLoaded(coinsWallet: state.coinsWallet));
      } else if (event is AddCoinToWallet) {
        emit(const CoinWalletLoading());
        final coinWallet = await getCoinWallet(event.coinId, event.amount);
        final newList = [...state.coinsWallet];
        newList.add(coinWallet);
        print(newList.length);
        newList.forEach((element) {
          print(element.coin.name);
        });
        emit(CoinWalletLoaded(coinsWallet: newList));
      }
    });
  }

  Future<CoinWallet> getCoinWallet(String coinId, double amount) async {
    final coin = await _repository.fetchCoinById(coinId);
    return CoinWallet(
      coin: coin,
      amount: amount,
    );
  }
}
