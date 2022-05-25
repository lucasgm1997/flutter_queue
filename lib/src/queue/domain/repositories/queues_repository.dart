import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';

abstract class IQueueRepository {
  Stream<List<QueueEntity>> getAllQueues();

  Future<void> addQueue(QueueEntity entity);

  Future<void> removeQueue(QueueEntity entity);

  Future<void> removeAllOrders();
}