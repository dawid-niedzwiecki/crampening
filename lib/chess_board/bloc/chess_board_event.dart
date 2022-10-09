part of 'chess_board_bloc.dart';

abstract class ChessBoardEvent extends Equatable {
  const ChessBoardEvent();

  @override
  List<Object> get props => [];
}

class ChessBoardPlayerMovedEvent extends ChessBoardEvent {
  const ChessBoardPlayerMovedEvent();

  @override
  List<Object> get props => [];
}
