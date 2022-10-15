import 'dart:convert';

class Move {
  Move({
    required this.notation,
    List<Move>? next,
  }) : next = next ?? <Move>[];

  /// Creates a [Move] from JSON format
  factory Move.fromJson(Map<String, dynamic> json) => Move(
        notation: json['notation'] as String,
        next: (json['next'] as List)
            .cast<Map<String, dynamic>>()
            .map(Move.fromJson)
            .toList(),
      );

  /// Creates a [Move] from bracket format
  ///
  /// Example input:
  ///
  /// `e4(e5(Nf3))(d5)`
  factory Move.fromBracketFormat(String string) {
    final buffer = StringBuffer();
    final moves = <Move>[];

    for (final char in string.split('')) {
      if (char == '(') {
        if (buffer.isNotEmpty) {
          moves.add(Move(notation: buffer.toString()));
          buffer.clear();
        }
      } else if (char == ')') {
        if (buffer.isNotEmpty) {
          moves.add(Move(notation: buffer.toString()));
          buffer.clear();
        }
        final move = moves.removeLast();
        moves.last.next.add(move);
      } else {
        buffer.write(char);
      }
    }

    return moves.single;
  }

  /// Creates a [Move] from a string in PGN format.
  ///
  /// [pgn] can *not* be empty (minimum one move must have been played).
  factory Move.fromPGN(String pgn) {
    final bracketFormat = pgnToBracketFormat(pgn);

    return Move.fromBracketFormat(bracketFormat);
  }

  /// Constructs a [Move] combined from multiple [Move] instances.
  /// 
  /// The first move in each [Move] has to be identical.
  /// 
  /// ### Example:
  /// 
  /// ```
  /// final move1 = Move.fromBracketFormat('e4(e5(Nf3(Nc6)))');
  /// final move2 = Move.fromBracketFormat('e4(e5(Nf3(Nf6)))');
  /// final result = Move.combined([move1, move2]);
  /// print(result.toBracketFormat());
  /// ```
  /// 
  /// output: `e4(e5(Nf3(Nc6)(Nf6)))
  factory Move.combined(List<Move> moves) {
    final areFirstMovesIdentical = moves.every((element) {
      return element.notation == moves[0].notation;
    });
    if (!areFirstMovesIdentical) {
      throw ArgumentError('Combined moves need to start with the same move!');
    }
    // TODO: Implement Move.combined
    throw UnimplementedError('Not yet implemented');
  }

  /// The move in algebraic notation
  ///
  /// Examples:
  ///
  /// `e4`, `Nf3`, `Qe7+`, `Qh4xe1`
  String notation;

  /// List of acceptable subsequent moves.
  List<Move> next;

  /// Converts a PGN string to bracket format
  ///
  /// Example input:
  ///
  /// `1. e4 e5 2. Nf3 Nc6 3. Bb5 Nf6`
  ///
  /// Example output:
  ///
  /// `e4(e5(Nf3(Nc6(Bb5(Nf6)))))`
  static String pgnToBracketFormat(String pgn) {
    if (pgn.isEmpty) {
      throw const FormatException("Invalid format! PGN Can't be empty!");
    }

    final partList = pgn.split(' ');

    // Remove all move numbers, leave move notations:
    final sanitizedMoveList = <String>[];
    for (var i = 0; i < partList.length; i++) {
      if (i % 3 == 0) continue;
      sanitizedMoveList.add(partList[i]);
    }

    // Buffer for bracket format
    final buffer = StringBuffer();

    // Used for establishing the amount of closing bracketss
    var counter = 0;

    // Generating opening brackets and moves
    for (var i = 0; i < sanitizedMoveList.length; i++) {
      // last element without the opening bracket
      if (i == sanitizedMoveList.length - 1) {
        buffer.write(sanitizedMoveList[i]);
        // also counter doesn't increment
        break;
      }
      buffer.write('${sanitizedMoveList[i]}(');
      counter++;
    }
    // Generating closing brackets
    for (; counter > 0; counter--) {
      buffer.write(')');
    }

    return buffer.toString();
  }

  /// A JSON representation of this [Move] object.
  Map<String, dynamic> toJson() {
    return {
      'notation': notation,
      'next': jsonEncode(next.map((e) => e.toJson()).toList()),
    };
  }

  /// A string representation of a move tree in bracket format
  ///
  /// Example output:
  ///
  /// `e4(e5(Nf3))(d5)`
  String toBracketFormat() {
    final buffer = StringBuffer(notation);
    for (final move in next) {
      buffer.write('(${move.toBracketFormat()})');
    }

    return buffer.toString();
  }
}
