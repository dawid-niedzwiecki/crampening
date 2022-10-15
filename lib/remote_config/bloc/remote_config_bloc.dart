// ignore_for_file: require_trailing_commas

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/remote_config.dart';

part 'remote_config_event.dart';
part 'remote_config_state.dart';

class RemoteConfigBloc extends Bloc<RemoteConfigEvent, RemoteConfigState> {
  RemoteConfigBloc({required RemoteConfigRepository remoteConfigRepo})
      : _remoteConfigRepo = remoteConfigRepo,
        super(RemoteConfigInitialState(printable: remoteConfigRepo.printable)) {
    on<RemoteConfigInitialiseEvent>(_onInitialise);
  }

  Future<void> _onInitialise(
    RemoteConfigInitialiseEvent event,
    Emitter<RemoteConfigState> emit,
  ) async {
    emit(const RemoteConfigLoadingState());
    await _remoteConfigRepo.initRepository();
    emit(RemoteConfigLoadedState(
      printable: _remoteConfigRepo.printable,
    ));
  }

  final RemoteConfigRepository _remoteConfigRepo;
}
