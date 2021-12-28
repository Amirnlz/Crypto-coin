import 'package:bloc/bloc.dart';
import '../../models/coin/coin_details.dart';
import '../../resources/coin_repository.dart';
import 'package:meta/meta.dart';

part 'coin_details_event.dart';
part 'coin_details_state.dart';

class CoinDetailsBloc extends Bloc<CoinDetailsEvent, CoinDetailsState> {
  final _repository = CoinRepository();

  CoinDetailsBloc() : super(const CoinDetailsInitial()) {
    on<CoinDetailsEvent>(
      (event, emit) {
        print(event);
        if (event is GetCoinDetailsById) {
          emit(const CoinDetailsLoading());
          _repository.fetchCoinDetailsById(event.id).then(
            (value) {
              emit(CoinDetailsLoaded(value));
            },
          ).catchError(
            (error) {
              emit(CoinDetailsError(error));
            },
          );
        }
      },
    );
  }
}
