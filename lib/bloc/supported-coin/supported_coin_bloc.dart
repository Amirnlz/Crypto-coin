import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/coin/supported_coin.dart';
import '../../resources/coin_repository.dart';

part 'supported_coin_event.dart';
part 'supported_coin_state.dart';

class SupportedCoinBloc
    extends Bloc<SupportedCoinEvent, SupportedCoinListState> {
  final _repoitory = CoinRepository();

  SupportedCoinBloc() : super(const SupportedCoinInitial()) {
    on<SupportedCoinEvent>((event, emit) async {
      if (event is GetSupportedCoin) {
        emit(const SupportedCoinLoading());
        try {
          await _repoitory.fetchSupportedCoin.then((coins) {
            emit(SupportedCoinLoaded(supportedCoin: coins));
          });
        } catch (e) {
          emit(const SupportedCoinError(
              message: 'Please check your internet connection!'));
        }
      }
    });
  }
}
