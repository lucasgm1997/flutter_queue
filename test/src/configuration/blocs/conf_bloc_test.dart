import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_queue/src/configuration/blocs/conf_bloc.dart';
import 'package:flutter_queue/src/configuration/configuration_state.dart';
import 'package:flutter_queue/src/configuration/events/configuration_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mocks.dart';

void main() {

  blocTest<ConfigurationBloc, ConfigurationState>('conf bloc ...',
    build: () {
      final usecase = IGetAllQueuesUsecaseMock();
      final addNewQueueUsecase = AddNewQueueUsecaseMock();

      when( () => usecase.call() ).thenAnswer( (_) => Stream.value([]));

      return ConfigurationBloc(usecase, addNewQueueUsecase);
    },
    act: (bloc) => bloc.add(FetchQueuesConfigurationEvent()),
    wait: const Duration(milliseconds: 500),
    expect: (){
      return [
        isA<LoadingConfigurationState>(),
        isA<LoadedConfigurationState>()];
    }    
  );
}