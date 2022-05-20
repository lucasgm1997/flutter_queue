import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';

abstract class ConfState{

}

class EmptyConfState implements ConfState{}

class LoadingConfState implements ConfState{}

class LoadedConfState implements ConfState {
  final List<QueueEntity> queues;

  LoadedConfState(this.queues);
}

class ExcpetionConfState implements ConfState{
  final String message;

  ExcpetionConfState(this.message);
}