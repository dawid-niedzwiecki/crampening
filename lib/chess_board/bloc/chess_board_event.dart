part of 'chess_board_bloc.dart';

abstract class ChessBoardEvent extends Equatable {
  const ChessBoardEvent();

  @override
  List<Object> get props => [];
}

class ChessBoardDataRequestedEvent extends ChessBoardEvent {
  const ChessBoardDataRequestedEvent();
}
