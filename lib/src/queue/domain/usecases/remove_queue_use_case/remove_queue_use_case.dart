import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/repositories/queues_repository.dart';
import 'package:flutter_queue/src/queue/domain/usecases/remove_queue_use_case/remove_queue_use_case_imp.dart';

class RemoveQueueUsecaseImp implements IRemoveQueueUsecase {
  final IQueueRepository repository;

  RemoveQueueUsecaseImp(this.repository);

  @override
  Future<void> call(QueueEntity entity) async {
    return repository.removeQueue(entity);
  }

}