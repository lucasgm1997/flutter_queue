import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_queue/src/queue/domain/repositories/queues_repository.dart';
import 'package:flutter_queue/src/queue/domain/usecases/get_all_queues_usecase/get_all_queues_usecase.dart';
import 'package:flutter_queue/src/queue/domain/usecases/get_all_queues_usecase/get_all_queues_usecase_imp.dart';
import 'package:flutter_queue/src/queue/external/queue_firestore_datasource.dart';
import 'package:flutter_queue/src/queue/infra/datasource/queue_datasource.dart';
import 'package:flutter_queue/src/queue/infra/repositories/queue_repository_imp.dart';
import 'package:provider/provider.dart';

final queueModule = [
  Provider<FirebaseFirestore>.value(value: FirebaseFirestore.instance),
  Provider<IQueueDataSource>(create: ((context) => QueueFirestoreDataSource(context.read())),),
  Provider<IQueueRepository>(create: ((context) => QueueRepositoryImp(context.read())),),
  Provider<IGetAllQueuesUsecase>(create: ((context) => GetAllQueuesUsecaseImp(context.read())),)
 ];