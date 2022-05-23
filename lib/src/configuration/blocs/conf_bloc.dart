// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_queue/src/configuration/configuration_state.dart';
import 'package:flutter_queue/src/configuration/events/configuration_event.dart';
import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/usecases/get_all_queues_usecase/get_all_queues_usecase.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {

  final IGetAllQueuesUsecase getAllQueuesUsecase;

  ConfigurationBloc(this.getAllQueuesUsecase) : super(EmptyConfigurationState()) {

    on<FetchQueuesConfigurationEvent>(
      (
        (event, emit) async {

          emit(LoadingConfigurationState());//

          await emit.onEach<List<QueueEntity>>(
            getAllQueuesUsecase.call(),
            onData: (queues){
               emit(LoadedConfigurationState(queues));
            },
          );
        }
      ),
      transformer: restartable()
    );

  }

 
}