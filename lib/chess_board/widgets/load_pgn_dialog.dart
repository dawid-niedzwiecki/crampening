import 'package:crampening/chess_board/models/models.dart';
import 'package:flutter/material.dart';

class LoadDialog extends StatelessWidget {
  LoadDialog({
    super.key,
    required this.dataType,
  });

  final pgnController = TextEditingController();
  final DataType dataType;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Wklej ${dataType.displayName}:',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: pgnController,
                      minLines: 5,
                      maxLines: null,
                      decoration: InputDecoration(
                        label: Text(dataType.displayName),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context, pgnController.text);
                      },
                      icon: const Icon(Icons.save_alt),
                      label: const Text('Wczytaj'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
