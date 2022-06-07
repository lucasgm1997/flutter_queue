import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';

abstract class IRemoveQueueUsecase {
  Future<void> call(QueueEntity entity);
}
