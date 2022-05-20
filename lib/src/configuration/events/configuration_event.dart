import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';

abstract class ConfEvent { }

class GetAllQueues implements ConfEvent {

}

class FetchQueuesConfigurationEvent implements ConfEvent {
  final List<QueueEntity> queues;

  FetchQueuesConfigurationEvent(this.queues);
}