import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/value_objects/order.dart';
import 'package:flutter_queue/src/queue/infra/adapters/json_to_queue.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Deve converter um map em um objeto do tipo QueueEntity', ()  {

    final queue = JsonToQueue.fromMap({
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
    });

    expect(queue, isA<QueueEntity>());
    expect(queue.title, 'any_title');
    expect(queue.priority, 1);
    expect(queue.orders.first.status, EOrderStatus.attending);

  });

  

}