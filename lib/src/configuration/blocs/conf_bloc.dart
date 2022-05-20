import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_queue/src/configuration/conf_state.dart';
import 'package:flutter_queue/src/configuration/events/conf_event.dart';
import 'package:flutter_queue/src/queue/domain/usecases/get_all_queues_usecase.dart';

class ConfBloc extends Bloc<ConfEvent, ConfState> {

  final IGetAllQueuesUsecase getAllQueuesUsecase;
  late final StreamSubscription _subscription;

  ConfBloc(this.getAllQueuesUsecase) : super(EmptyConfState()) {
    
    _subscription = getAllQueuesUsecase.call().listen((data) { 
      add(AddQueuesConfEvent(data));
    });

    on<AddQueuesConfEvent>( (event, emit) => emit(LoadedConfState(event.queues)));
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

}