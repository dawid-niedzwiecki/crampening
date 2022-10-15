import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/realtime.dart';

part 'chess_board_event.dart';
part 'chess_board_state.dart';

class ChessBoardBloc extends Bloc<ChessBoardEvent, ChessBoardState> {
  ChessBoardBloc({
    required RealtimeRepository realtimeRepository,
  }) : _realtimeRepository = realtimeRepository, super(ChessBoardInitial()) {
    on<ChessBoardDataRequestedEvent>(_onDataRequested);
  }

  final RealtimeRepository _realtimeRepository;

  Future<void> _onDataRequested(
    ChessBoardDataRequestedEvent event,
    Emitter<ChessBoardState> emit,
  ) {
    return Future(()=>null);
  }
}
