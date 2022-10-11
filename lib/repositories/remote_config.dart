import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigRepository {
  RemoteConfigRepository({
    required this.remoteConfig,
  });

  final FirebaseRemoteConfig remoteConfig;

  Future<void> initRepository() async {
    await remoteConfig.fetchAndActivate();
  }

  String get printable => remoteConfig.getString('printable');
}
