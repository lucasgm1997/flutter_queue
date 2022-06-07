import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/usecases/get_all_queues_usecase/get_all_queues_usecase_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('Deve retornar uma lista de QueueEntity', () {
    final repositoryMock = GetAllQueuesRepositorysMock();
    final entity = QueueEntityMock();

    when(
      () => repositoryMock.getAllQueues(),
    ).thenAnswer((invocation) => Stream.value([entity]));

    final usecase = GetAllQueuesUsecaseImp(repositoryMock);

    final result = usecase.call();

    expect(result, emits(isA<List<QueueEntity>>()));
  });
}
