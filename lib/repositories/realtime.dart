import 'package:firebase_database/firebase_database.dart';

class RealtimeRepository {
  RealtimeRepository({
    required FirebaseDatabase firebaseDatabase,
  }) :_database = firebaseDatabase {
    init();
  }

  late final DatabaseReference _testReference;
  late final FirebaseDatabase _database;

  void init() {
    _database.setLoggingEnabled(true);
    _testReference = _database.ref();
  }

  Future<String?> getData() async {
    final data = await _testReference.get();
    return data.value.toString();
  }
}
