import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';

abstract class ConfEvent { }

class GetAllQueues implements ConfEvent {

}

class AddQueuesConfEvent implements ConfEvent {
  final List<QueueEntity> queues;

  AddQueuesConfEvent(this.queues);
}