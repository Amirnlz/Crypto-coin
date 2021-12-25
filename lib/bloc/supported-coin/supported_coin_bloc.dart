import 'package:bloc/bloc.dart';
import 'package:crypto_coin/models/supported_coin.dart';
import 'package:crypto_coin/resources/coin_repository.dart';
import 'package:meta/meta.dart';

part 'supported_coin_event.dart';
part 'supported_coin_state.dart';

class SupportedCoinBloc extends Bloc<SupportedCoinEvent, SupportedCoinState> {
  final _repoitory = CoinRepository();

  SupportedCoinBloc() : super(const SupportedCoinInitial()) {
    on<SupportedCoinEvent>((event, emit) async {
      print(event);
      if (event is GetSupportedCoins) {
        emit(const SupportedCoinLoading());
        try {
          await _repoitory.fetchSupportedCoins().then((coins) {
            emit(SupportedCoinLoaded(supportedCoins: coins));
          });
        } catch (e) {
          emit(const SupportedCoinError(
              message: 'Please check your internet connection!'));
        }
      }
    });
  }
}
