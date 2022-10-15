import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart' hide Move;

import '../models/move.dart';

class SaveMenu extends StatefulWidget {
  const SaveMenu({
    super.key,
  });

  @override
  State<SaveMenu> createState() => _SaveMenuState();
}

class _SaveMenuState extends State<SaveMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          const SizedBox(height: 10),
          if (kDebugMode) ...[
            _buildDebugButton(),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        'Ustawienia gry',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 40,
        ),
      ),
    );
  }

  Widget _buildDebugButton() {
    return SizedBox(
      height: 60,
      child: ElevatedButton.icon(
        onPressed: () => _debug(context),
        label: const Text('Debug function'),
        icon: const Icon(Icons.bug_report),
      ),
    );
  }

  Future<void> _debug(BuildContext context) async {
    final x = context.read<ChessBoardController>().game.pgn();

    final first = '1. e4 e5 2. Nf3 Nc6';
    final second = '1. e4 e5 2. Nf3 Nf6';

    final move1 = Move.fromPGN(first);
    final move2 = Move.fromPGN(second);

    final move3 = Move.combined([move1, move2]);

    // print(move1.toBracketFormat());
  }
}
