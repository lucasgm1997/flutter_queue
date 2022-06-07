import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';

abstract class IUpdateQueueUsecase {
  Future<void> call(QueueEntity queueEntity);
}
