part of 'remote_config_bloc.dart';

abstract class RemoteConfigState extends Equatable {
  const RemoteConfigState({
    this.printable = '',
  });

  final String printable;

  @override
  List<Object> get props => [printable];
}

class RemoteConfigInitialState extends RemoteConfigState {
  const RemoteConfigInitialState({super.printable});
}

class RemoteConfigLoadingState extends RemoteConfigState {
  const RemoteConfigLoadingState({super.printable});
}

class RemoteConfigLoadedState extends RemoteConfigState {
  const RemoteConfigLoadedState({super.printable});
}
