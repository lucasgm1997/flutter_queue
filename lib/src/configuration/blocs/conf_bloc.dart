import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_queue/src/configuration/configuration_state.dart';
import 'package:flutter_queue/src/configuration/events/configuration_event.dart';
import 'package:flutter_queue/src/queue/domain/usecases/get_all_queues_usecase.dart';

class ConfBloc extends Bloc<ConfEvent, ConfigurationState> {

  final IGetAllQueuesUsecase getAllQueuesUsecase;
  late final StreamSubscription _subscription;

  ConfBloc(this.getAllQueuesUsecase) : super(EmptyConfigurationState()) {
    
    _subscription = getAllQueuesUsecase.call().listen((data) { 
      add(FetchQueuesConfigurationEvent(data));
    });

    on<FetchQueuesConfigurationEvent>( (event, emit) => emit(LoadedConfigurationState(event.queues)));
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

}