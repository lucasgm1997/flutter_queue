import 'package:flutter_queue/src/queue/domain/usecases/add_new_queue/add_new_queue_usecase_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  test('Deve adicionar uma nova queueEntity', () {
    final repositoryMock = GetAllQueuesRepositorysMock();
    final queue = QueueEntityMock();

    when(
      () => repositoryMock.addQueue(queue),
    ).thenAnswer((invocation) => Future.value());

    final addQueueUsecase = AddNewQueueUsecaseImp(repositoryMock);

    expect(addQueueUsecase.call(queue), completes);
  });
}
