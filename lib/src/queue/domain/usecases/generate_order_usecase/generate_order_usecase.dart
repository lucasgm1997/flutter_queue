import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';

abstract class IGenerateOrderUsecase {
  QueueEntity call(QueueEntity entity);
}
