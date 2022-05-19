import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';

abstract class IQueueRepository {
  Stream<List<QueueEntity>> getAllQueues();
}