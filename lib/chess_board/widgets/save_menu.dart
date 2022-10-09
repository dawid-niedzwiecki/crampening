import 'package:crampening/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
        onPressed: _debug,
        label: const Text('Debug function'),
        icon: const Icon(Icons.bug_report),
      ),
    );
  }

  Future<void> _debug() async {
    context.snack('DUPA');
  }
}
