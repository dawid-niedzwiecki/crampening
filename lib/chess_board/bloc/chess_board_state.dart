part of 'chess_board_bloc.dart';

abstract class ChessBoardState extends Equatable {
  const ChessBoardState();

  @override
  List<Object> get props => [];
}

class ChessBoardInitial extends ChessBoardState {}
