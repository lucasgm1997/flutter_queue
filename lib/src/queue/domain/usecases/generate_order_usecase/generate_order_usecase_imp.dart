import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/usecases/generate_order_usecase/generate_order_usecase.dart';
import 'package:flutter_queue/src/queue/domain/value_objects/order.dart';

class GenerateOrderUsecaseImp implements IGenerateOrderUsecase {
  // IQueueRepository queueRepository;
  // GenerateOrderUsecaseImp(this.queueRepository);

  @override
  QueueEntity call(QueueEntity queueEntity) {
    final totalOrders = queueEntity.orders.length;

    final order = Order(
      id: _generatePadLeft(totalOrders + 1),
      position: totalOrders + 1,
      status: EOrderStatus.wainting,
      timestamp: DateTime.now(),
    );

    final orders = List<Order>.from(queueEntity.orders);

    queueEntity.orders.add(order);
    orders.add(order);

    return QueueEntity(
      abbreviation: queueEntity.abbreviation,
      id: queueEntity.id,
      priority: queueEntity.priority,
      title: queueEntity.title,
      orders: orders,
    );
  }

  String _generatePadLeft(int id) => '$id'.padLeft(4, '0');
}
