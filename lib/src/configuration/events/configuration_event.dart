import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';

abstract class ConfigurationEvent { }

class GetAllQueues implements ConfigurationEvent {

}

class FetchQueuesConfigurationEvent implements ConfigurationEvent {}

class AddNewQueueConfigurationEvent implements ConfigurationEvent {
  final QueueEntity queueEntity;
  AddNewQueueConfigurationEvent(this.queueEntity);
}