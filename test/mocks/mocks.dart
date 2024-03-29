import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/repositories/queues_repository.dart';
import 'package:flutter_queue/src/queue/domain/usecases/add_new_queue/add_new_queue_usecase.dart';
import 'package:flutter_queue/src/queue/domain/usecases/get_all_queues_usecase/get_all_queues_usecase.dart';
import 'package:flutter_queue/src/queue/domain/usecases/remove_all_orders/remove_all_orders.dart';
import 'package:flutter_queue/src/queue/domain/usecases/remove_queue_use_case/remove_queue_use_case_imp.dart';
import 'package:flutter_queue/src/queue/infra/datasource/queue_datasource.dart';
import 'package:mocktail/mocktail.dart';

class GetAllQueuesRepositorysMock extends Mock implements IQueueRepository {}

class QueueEntityMock extends Mock implements QueueEntity {}

class IQueueDataSourceyMock extends Mock implements IQueueDataSource {}

class IGetAllQueuesUsecaseMock extends Mock implements IGetAllQueuesUsecase {}

class AddNewQueueUsecaseMock extends Mock implements IAddNewQueueUsecase {}

class RemoveQueueUsecaseMock extends Mock implements IRemoveQueueUsecase {}

class RemoveAllOrdersUsecaseMock extends Mock
    implements IRemoveAllOrdersUsecase {}
