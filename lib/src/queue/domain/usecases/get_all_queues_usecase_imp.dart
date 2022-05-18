import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/repositories/get_all_queues_repository.dart';
import 'package:flutter_queue/src/queue/domain/usecases/get_all_queues_usecase.dart';

class GetAllQueuesUsecaseImp implements IGetAllQueuesUsecase {

  IGetAllQueuesRepository _repository;

  GetAllQueuesUsecaseImp(this._repository);


  @override
  Stream<List<QueueEntity>> call() {
    return _repository.getAllQueues();
  }

}