import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_queue/src/configuration/blocs/conf_bloc.dart';
import 'package:flutter_queue/src/configuration/configuration_state.dart';
import 'package:flutter_queue/src/configuration/events/configuration_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mocks.dart';

void main() {

  blocTest<ConfigurationBloc, ConfigurationState>('Fetch queues',
    build: () {
      final usecase = IGetAllQueuesUsecaseMock();
      final addNewQueueUsecase = AddNewQueueUsecaseMock();
      final removeNewQueueUsecase = RemoveQueueUsecaseMock();
      final removeAllOrdersUsecase = RemoveAllOrdersUsecaseMock();

      when( () => usecase.call() ).thenAnswer( (_) => Stream.value([]));

      return ConfigurationBloc(usecase, addNewQueueUsecase, removeNewQueueUsecase, removeAllOrdersUsecase);
    },
    act: (bloc) => bloc.add(FetchQueuesConfigurationEvent()),
    wait: const Duration(milliseconds: 500),
    expect: (){
      return [
        isA<LoadingConfigurationState>(),
        isA<LoadedConfigurationState>()];
    }    
  );

   
   final entity = QueueEntityMock();
   blocTest<ConfigurationBloc, ConfigurationState>('Add new entity',
    build: () {
      final usecase = IGetAllQueuesUsecaseMock();
      final addNewQueueUsecase = AddNewQueueUsecaseMock();
      final removeNewQueueUsecase = RemoveQueueUsecaseMock();
      final removeAllOrdersUsecase = RemoveAllOrdersUsecaseMock();


      when( () => addNewQueueUsecase.call(entity) ).thenAnswer( (_) => Future.value([]));

      return ConfigurationBloc(usecase, addNewQueueUsecase, removeNewQueueUsecase, removeAllOrdersUsecase);
    },
    act: (bloc) => bloc.add(AddNewQueueConfigurationEvent(entity)),
    wait: const Duration(milliseconds: 500),
    expect: (){
      return [
       ];
    }    
  );

  blocTest<ConfigurationBloc, ConfigurationState>('Remove entity',
    build: () {
      final usecase = IGetAllQueuesUsecaseMock();
      final addNewQueueUsecase = AddNewQueueUsecaseMock();
      final removeNewQueueUsecase = RemoveQueueUsecaseMock();
      final removeAllOrdersUsecase = RemoveAllOrdersUsecaseMock();

      when( () => removeNewQueueUsecase.call(entity) ).thenAnswer( (_) => Future.value([]));

      return ConfigurationBloc(usecase, addNewQueueUsecase, removeNewQueueUsecase, removeAllOrdersUsecase);
    },
    act: (bloc) => bloc.add(RemoveQueueConfigurationEvent(entity)),
    wait: const Duration(milliseconds: 500),
    expect: (){
      return [];
    }    
  );

  blocTest<ConfigurationBloc, ConfigurationState>('Fetch with errors',
    build: () {
      final usecase = IGetAllQueuesUsecaseMock();
      final addNewQueueUsecase = AddNewQueueUsecaseMock();
      final removeNewQueueUsecase = RemoveQueueUsecaseMock();
      final removeAllOrdersUsecase = RemoveAllOrdersUsecaseMock();

      when( () => usecase.call() ).thenAnswer( (_) => Stream.error(Exception('Fetch with errors')));

      return ConfigurationBloc(usecase, addNewQueueUsecase, removeNewQueueUsecase, removeAllOrdersUsecase);
    },
    act: (bloc) => bloc.add(FetchQueuesConfigurationEvent()),
    expect: (){
      return [
        isA<LoadingConfigurationState>(),
        isA<ExcpetionConfigurationState>(),
      ];
    }    
  );
}