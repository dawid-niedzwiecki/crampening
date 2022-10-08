import 'package:crampening/chess_board/bloc/chess_board_bloc.dart';
import 'package:crampening/chess_board/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:provider/provider.dart';

class ChessBoardPage extends StatelessWidget {
  const ChessBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChessBoardBloc(),
      child: Container(),
    );
  }
}

class ChessBoardView extends StatefulWidget {
  const ChessBoardView({super.key});

  @override
  State<ChessBoardView> createState() => _ChessBoardViewState();
}

class _ChessBoardViewState extends State<ChessBoardView> {
  final chessController = ChessBoardController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChessBoardController>(
      create: (context) => chessController,
      child: Scaffold(
        body: Center(
          child: Row(
            children: [
              const Expanded(
                child: GameMenu(),
              ),
              ChessBoard(
                controller: chessController,
              ),
              const Expanded(
                child: SaveMenu(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
