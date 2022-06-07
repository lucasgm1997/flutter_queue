import 'package:flutter_queue/src/queue/domain/repositories/queues_repository.dart';
import 'package:flutter_queue/src/queue/domain/usecases/remove_all_orders/remove_all_orders.dart';

class RemoveAllOrdersUsecaseImp implements IRemoveAllOrdersUsecase {
  IQueueRepository queueRepository;
  RemoveAllOrdersUsecaseImp(this.queueRepository);

  @override
  Future<void> call() {
    return queueRepository.removeAllOrders();
  }
}
