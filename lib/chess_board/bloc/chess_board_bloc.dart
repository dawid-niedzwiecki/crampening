import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chess_board_event.dart';
part 'chess_board_state.dart';

class ChessBoardBloc extends Bloc<ChessBoardEvent, ChessBoardState> {
  ChessBoardBloc() : super(ChessBoardInitial()) {
    // on<ChessBoardPlayerMovedEvent>(_onPlayerMoved);
  }

  // void _onPlayerMoved(
    // ChessBoardPlayerMovedEvent event,
    // Emitter<ChessBoardState> emit,
  // ) {

  // }
}
