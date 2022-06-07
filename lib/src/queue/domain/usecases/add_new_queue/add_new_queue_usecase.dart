import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';

abstract class IAddNewQueueUsecase {
  Future<void> call(QueueEntity queue);
}
