import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:provider/provider.dart';

class GameMenu extends StatelessWidget {
  const GameMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChessBoardController>(
      builder: (context, chessNotifier, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAppLogo(),
            const SizedBox(height: 10),
            _buildGameHistory(),
            const SizedBox(height: 10),
            _buildNavigationMenu(),
            const SizedBox(height: 10),
            _buildResetButton(context),
          ],
        );
      },
    );
  }

  Widget _buildAppLogo() {
    return const Text(
      'Crampening',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40,
      ),
    );
  }

  Widget _buildGameHistory() {
    return Consumer<ChessBoardController>(
      builder: (context, chessNotifier, child) {
        return Text(chessNotifier.getSan().join(' '));
      },
    );
  }

  Widget _buildNavigationMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          tooltip: 'Początek partii',
          icon: const Icon(Icons.keyboard_double_arrow_left),
          onPressed: _onTapRewind,
        ),
        IconButton(
          tooltip: 'Poprzedni ruch',
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: _onTapPrevious,
        ),
        IconButton(
          tooltip: 'Następny ruch',
          icon: const Icon(Icons.keyboard_arrow_right),
          onPressed: _onTapNext,
        ),
        IconButton(
          tooltip: 'Najnowszy ruch',
          icon: const Icon(Icons.keyboard_double_arrow_right),
          onPressed: _onTapLatest,
        ),
      ],
    );
  }

  Widget _buildResetButton(BuildContext context) {
    return SizedBox(
      height: 60,
      child: IconButton(
        tooltip: 'Zresetuj grę',
        icon: const Icon(Icons.restart_alt),
        onPressed: () => _onResetGame(context),
      ),
    );
  }

  void _onTapRewind() {
    // ..
  }

  void _onTapPrevious() {
    // ..
  }

  void _onTapNext() {
    // ..
  }

  void _onTapLatest() {
    // ..
  }

  void _onResetGame(BuildContext context) {
    context.read<ChessBoardController>().resetBoard();
  }
}
