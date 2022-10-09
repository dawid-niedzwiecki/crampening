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
      child: ChangeNotifierProvider<ChessBoardController>(
        lazy: false,
        create: (context) => ChessBoardController(),
        child: const ChessBoardView(),
      ),
    );
  }
}

class ChessBoardView extends StatelessWidget {
  const ChessBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            const Expanded(
              child: GameMenu(),
            ),
            ChessBoard(
              controller: context.select((ChessBoardController c) => c),
            ),
            const Expanded(
              child: SaveMenu(),
            ),
          ],
        ),
      ),
    );
  }
}
