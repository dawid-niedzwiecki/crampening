part of 'remote_config_bloc.dart';

abstract class RemoteConfigEvent extends Equatable {
  const RemoteConfigEvent();

  @override
  List<Object> get props => [];
}

class RemoteConfigInitialiseEvent extends RemoteConfigEvent {
  const RemoteConfigInitialiseEvent();
}
