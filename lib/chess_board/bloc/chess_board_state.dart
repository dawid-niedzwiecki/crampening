part of 'chess_board_bloc.dart';

abstract class ChessBoardState extends Equatable {
  const ChessBoardState();

  @override
  List<Object?> get props => [];
}

class ChessBoardInitial extends ChessBoardState {}

class ChessBoardLoadingState extends ChessBoardState {}

class ChessBoardDataLoadedState extends ChessBoardState {
  const ChessBoardDataLoadedState(this.data);

  final String? data;

  @override
  List<Object?> get props => [data];
}

class ChessBoardErrorState extends ChessBoardState {
  const ChessBoardErrorState(this.errorMessage);

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
