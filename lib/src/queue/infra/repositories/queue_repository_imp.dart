import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/repositories/queues_repository.dart';
import 'package:flutter_queue/src/queue/infra/adapters/json_to_queue.dart';
import 'package:flutter_queue/src/queue/infra/datasource/queue_datasource.dart';

class QueueRepositoryImp implements IQueueRepository {

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
  
  @override
  Future<void> addQueue(QueueEntity queue) async {
    final map = JsonToQueue.toMap(queue);
    
    await _dataSource.addQueue(map);
    
  }
  
  @override
  Future<void> removeQueue(QueueEntity entity) async{
    
    await _dataSource.removeQueue(entity.id);
  }

}