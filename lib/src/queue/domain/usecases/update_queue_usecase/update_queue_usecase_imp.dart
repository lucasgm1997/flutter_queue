import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/repositories/queues_repository.dart';
import 'package:flutter_queue/src/queue/domain/usecases/update_queue_usecase/update_queue_usecase.dart';

class UpdateQueueUsecaseImp implements IUpdateQueueUsecase {

  IQueueRepository queueRepository;
  UpdateQueueUsecaseImp(this.queueRepository);

  @override
  Future<void> call(QueueEntity queueEntity) async {
    
    queueRepository.updateQueue(queueEntity);
  }

}