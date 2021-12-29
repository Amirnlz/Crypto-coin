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

        final newList = await getNewCoinWalletList(
            event.coinWalletList, event.coinId, event.amount);

        emit(CoinWalletLoaded(coinsWallet: newList));
      }
    });
  }

  Future<List<CoinWallet>> getNewCoinWalletList(
    List<CoinWallet> prevCoinList,
    String coinId,
    double amount,
  ) async {
    final coinWallet = await getCoinWallet(coinId, amount);

    final newList = [...prevCoinList];
    newList.add(coinWallet);

    return newList;
  }

  Future<CoinWallet> getCoinWallet(String coinId, double amount) async {
    final coin = await _repository.fetchCoinById(coinId);
    return CoinWallet(
      coin: coin,
      amount: amount,
    );
  }
}
