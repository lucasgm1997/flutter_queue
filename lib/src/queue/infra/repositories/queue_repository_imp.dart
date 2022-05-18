import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/repositories/get_all_queues_repository.dart';
import 'package:flutter_queue/src/queue/infra/adapters/json_to_queue.dart';
import 'package:flutter_queue/src/queue/infra/datasource/queue_datasource.dart';

class QueueRepositoryImp implements IGetAllQueuesRepository {

  final IQueueDataSource _dataSource;

  QueueRepositoryImp(this._dataSource);
  
  @override
  Stream<List<QueueEntity>> getAllQueues() {
    final stream = _dataSource.getAllQueues();
    return stream.map((List<Map<dynamic, dynamic>> list) => _convert(list));
  }

  List<QueueEntity> _convert(List<Map> list) {
    return list.map(JsonToQueue.fromMap).toList();
  }

}