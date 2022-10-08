enum DataType {
  pgn('PGN'),
  fen('FEN');

  const DataType(this.displayName);

  final String displayName;
}
