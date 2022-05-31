import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/usecases/generate_order_usecase/generate_order_usecase_imp.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  
  test('Deve gerar uma nova order', ()  {
    final generateOrderUsecase = GenerateOrderUsecaseImp();
    final queueEntity = QueueEntity(id: 'asd', title: 'generate_order', abbreviation: 'g_o', priority: 1, orders: []);
    

    final result = generateOrderUsecase.call(queueEntity);

    expect(result.orders.length, 1);
    expect(result.orders.first.id, '0001');
    expect(result.orders.first.position, 1);

  });
}