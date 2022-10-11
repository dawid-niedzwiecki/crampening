import 'package:crampening/remote_config/bloc/remote_config_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:provider/provider.dart';

class GameMenu extends StatelessWidget {
  const GameMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChessBoardController>(
      builder: (context, chessNotifier, child) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildAppLogo(),
              const SizedBox(height: 10),
              _buildGameHistory(chessNotifier),
              const SizedBox(height: 10),
              Container(
                height: 50,
                color: Colors.red,
                child: _buildRemoteConfigTest(),
              ),
              const SizedBox(height: 10),
            ],
          ),
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

  Widget _buildGameHistory(ChessBoardController chessController) {
    return Text(chessController.getSan().join(' '));
  }

  Widget _buildRemoteConfigTest() {
    return BlocBuilder<RemoteConfigBloc, RemoteConfigState>(
      builder: (context, state) {
        return Text(
          state.printable,
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
