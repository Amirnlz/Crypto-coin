
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/wallet/coin_wallet.dart';
import '../../resources/coin_repository.dart';

part 'coin_wallet_event.dart';
part 'coin_wallet_state.dart';

class CoinWalletBloc extends Bloc<CoinWalletEvent, CoinWalletState> {
  final _repository = CoinRepository();

  CoinWalletBloc() : super(const CoinWalletInitial()) {
    on<CoinWalletEvent>(
      (event, emit) async {
        if (event is GetCoinWallet) {
          if (event.coinWalletList.isNotEmpty) {

            final totalAmount = sumAssetsAmount(event.coinWalletList);
            final totalProfitPercent = sumProfitPercent(event.coinWalletList);

            emit(CoinWalletListLoaded(
              coinsWallet: event.coinWalletList,
              amount: totalAmount,
              profitPercentage: totalProfitPercent,
            ));
          } else {

            emit(CoinWalletListLoaded(coinsWallet: state.coinsWallet));
          }
        } else if (event is AddCoinToWallet) {
          emit(const CoinWalletLoading());
          try {
            final newList = await getNewCoinWalletList(
                event.coinWalletList, event.coinId, event.amount);
            final totalAmount = sumAssetsAmount(newList);
            final totalProfitPercent = sumProfitPercent(newList);

            emit(CoinWalletListLoaded(
                coinsWallet: newList,
                amount: totalAmount,
                profitPercentage: totalProfitPercent));
          } catch (e) {
            emit(const CoinWalletError(error: 'Error adding coin to wallet'));
          }
        }
      },
    );
  }

  double sumAssetsAmount(List<CoinWallet> list) {
    double totalAmount = 0;
    for (var coin in list) {
      totalAmount += coin.currentPrice;
    }
    return totalAmount;
  }

  double sumProfitPercent(List<CoinWallet> list) {
    double totalProfitPercent = 0;
    for (var coin in list) {
      totalProfitPercent += coin.priceChangePercentage24H;
    }
    return totalProfitPercent;
  }

  Future<List<CoinWallet>> getNewCoinWalletList(
      List<CoinWallet> prevCoinList, String coinId, double amount) async {
    final newList = [...prevCoinList];

    if (isCoinAlreadyInWallet(prevCoinList, coinId)) {
      int index = getIndexOfCoinInWallet(prevCoinList, coinId);
      newList[index].sumWithAmount(amount);
    } else {
      final coinWallet = await getCoinWallet(coinId, amount);

      newList.add(coinWallet);
    }
    return newList;
  }

  Future<CoinWallet> getCoinWallet(String coinId, double amount) async {
    final coin = await _repository.fetchCoinById(coinId);
    return CoinWallet(
      coin: coin,
      amount: amount,
    );
  }

  bool isCoinAlreadyInWallet(List<CoinWallet> list, String coinId) {
    for (var coin in list) {
      if (coin.id == coinId) {
        return true;
      }
    }
    return false;
  }

  int getIndexOfCoinInWallet(List<CoinWallet> list, String coinId) {
    for (var coin in list) {
      if (coin.id == coinId) {
        return list.indexOf(coin);
      }
    }
    return -1;
  }
}
