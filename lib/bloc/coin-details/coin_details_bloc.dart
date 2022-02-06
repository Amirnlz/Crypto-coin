import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/coin/coin_details.dart';
import '../../resources/coin_repository.dart';

part 'coin_details_event.dart';
part 'coin_details_state.dart';

class CoinDetailsBloc extends Bloc<CoinDetailsEvent, CoinDetailsState> {
  final _repository = CoinRepository();

  CoinDetailsBloc() : super(const CoinDetailsInitial()) {
    on<GetCoinDetailsById>(_getCoinDetailsById);
  }

  void _getCoinDetailsById(event, emit) async {
    emit(const CoinDetailsLoading());
    await _repository.fetchCoinDetailsById(event.id).then(
      (value) {
        emit(CoinDetailsLoaded(value));
      },
    ).catchError(
      (error) {
        emit(const CoinDetailsError('Error fetching coin details'));
      },
    );
  }
}
