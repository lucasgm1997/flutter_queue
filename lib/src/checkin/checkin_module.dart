import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_queue/src/checkin/blocs/Checkin_bloc.dart';
import 'package:flutter_queue/src/queue/domain/usecases/generate_order_usecase/generate_order_usecase.dart';
import 'package:flutter_queue/src/queue/domain/usecases/get_all_queues_usecase/get_all_queues_usecase.dart';
import 'package:flutter_queue/src/queue/domain/usecases/update_queue_usecase/update_queue_usecase.dart';

final checkinModule = [
  BlocProvider(
      create: (context) => CheckinBloc(
            context.read<IGetAllQueuesUsecase>(),
            context.read<IGenerateOrderUsecase>(),
            context.read<IUpdateQueueUsecase>(),
          )),
];
