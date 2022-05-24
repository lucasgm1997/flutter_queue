import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_queue/src/configuration/blocs/conf_bloc.dart';
import 'package:flutter_queue/src/queue/domain/usecases/add_new_queue/add_new_queue_usecase.dart';
import 'package:flutter_queue/src/queue/domain/usecases/get_all_queues_usecase/get_all_queues_usecase.dart';

final configurationModule = [
  BlocProvider(create: (context) => ConfigurationBloc(context.read<IGetAllQueuesUsecase>(), context.read<IAddNewQueueUsecase>())),
];