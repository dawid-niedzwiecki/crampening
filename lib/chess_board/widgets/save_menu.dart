import 'package:crampening/chess_board/chess_board.dart';
import 'package:crampening/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:provider/provider.dart';

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
          _buildLoadDataButton(DataType.pgn),
          const SizedBox(height: 10),
          _buildCopyDataButton(DataType.pgn),
          const SizedBox(height: 10),
          _buildLoadDataButton(DataType.fen),
          const SizedBox(height: 10),
          _buildCopyDataButton(DataType.fen),
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

  Widget _buildLoadDataButton(DataType dataType) {
    return SizedBox(
      height: 60,
      child: ElevatedButton.icon(
        onPressed: () => _loadData(dataType),
        label: Text('Wczytaj ${dataType.displayName}'),
        icon: const Icon(Icons.save_alt),
      ),
    );
  }

  Widget _buildCopyDataButton(DataType dataType) {
    return SizedBox(
      height: 60,
      child: ElevatedButton.icon(
        onPressed: () => _copyData(context, dataType),
        label: Text('Skopiuj ${dataType.displayName}'),
        icon: const Icon(Icons.copy),
      ),
    );
  }

  Widget _buildDebugButton() {
    return SizedBox(
      height: 60,
      child: ElevatedButton.icon(
        onPressed: _debug,
        label: const Text('Debug function'),
        icon: const Icon(Icons.bug_report),
      ),
    );
  }

  Future<void> _debug() async {}

  Future<void> _loadData(DataType dataType) async {
    final controller = context.read<ChessBoardController>();
    final data = await showDialog<String>(
      context: context,
      builder: (context) {
        return LoadDialog(
          dataType: dataType,
        );
      },
    );

    if (data != null) {
      switch (dataType) {
        case DataType.fen:
          controller.loadFen(data);
          break;
        case DataType.pgn:
          controller.loadPGN(data);
          break;
      }
      if (!mounted) return;
      context.snack('Wczytano ${dataType.displayName}!');
    }
  }

  Future<void> _copyData(BuildContext context, DataType dataType) async {
    late final String data;
    final controller = context.read<ChessBoardController>();
    switch (dataType) {
      case DataType.fen:
        data = controller.getFen();
        break;
      case DataType.pgn:
        data = controller.game.pgn();
        break;
    }
    await Clipboard.setData(ClipboardData(text: data));
    if (!mounted) return;
    context.snack('Skopiowano ${dataType.displayName} do schowka!');
  }
}
