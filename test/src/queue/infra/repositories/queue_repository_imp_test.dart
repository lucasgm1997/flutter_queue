import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/infra/repositories/queue_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';


void main() {
  test('Deve receber uma Stream de Map e converter para uma Stream de QueueEntity ', () {
    final datasource = IQueueDataSourceyMock();

    when(() => datasource.getAllQueues())
        .thenAnswer(
          (invocation) => Stream.value([
              {
                'id': 'any_id',
                'title': 'any_title',
                'priority': 1,
                'abbreviation': 'abbr',
                'orders': [
                  {
                    'id': 'dfsdfsd',
                    'position': 1,
                    'status': 'attending',
                    'timestamp': '2022-03-31 18:37:30',
                  },
                ],
              }
            ])
          );

    final repository = QueueRepositoryImp(datasource);
    final result = repository.getAllQueues();

    expect(result, emits( isA<List<QueueEntity>>()  ));
  });

  
}
