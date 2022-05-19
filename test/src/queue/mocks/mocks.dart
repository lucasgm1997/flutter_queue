import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/repositories/queues_repository.dart';
import 'package:flutter_queue/src/queue/infra/datasource/queue_datasource.dart';
import 'package:mocktail/mocktail.dart';

class GetAllQueuesRepositorysMock extends Mock implements IQueueRepository{}
class QueueEntityMock extends Mock implements QueueEntity{}

class IQueueDataSourceyMock extends Mock implements IQueueDataSource{}
