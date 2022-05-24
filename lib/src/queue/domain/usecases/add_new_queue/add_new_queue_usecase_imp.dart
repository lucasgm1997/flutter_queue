import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/repositories/queues_repository.dart';
import 'package:flutter_queue/src/queue/domain/usecases/add_new_queue/add_new_queue_usecase.dart';

class AddNewQueueUsecaseImp implements IAddNewQueueUsecase {

  final IQueueRepository _queueRepository;
  AddNewQueueUsecaseImp(this._queueRepository);

  @override
  Future<void> call(QueueEntity queue) async{
    return await _queueRepository.addQueue(queue);
  }

}