import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/value_objects/order.dart';

abstract class CheckinEvent {}

class FetchAllQueuesCheckinEvent implements CheckinEvent {}

class GenerateOrderCheckinEvent implements CheckinEvent {
  final QueueEntity queue;

  GenerateOrderCheckinEvent(this.queue);
}

class PrintOrderCheckinEvent implements CheckinEvent {
  final Order order;
  PrintOrderCheckinEvent(this.order);
}

