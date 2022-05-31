import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_queue/src/checkin/events/checkin_event.dart';
import 'package:flutter_queue/src/checkin/states/checkin_state.dart';
import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/usecases/generate_order_usecase/generate_order_usecase.dart';
import 'package:flutter_queue/src/queue/domain/usecases/get_all_queues_usecase/get_all_queues_usecase.dart';
import 'package:flutter_queue/src/queue/domain/usecases/update_queue_usecase/update_queue_usecase.dart';

class CheckinBloc extends Bloc<CheckinEvent, CheckinState> {

  final IGetAllQueuesUsecase getAllQueuesUsecase;
  final IGenerateOrderUsecase generateOrderUsecase;
  final IUpdateQueueUsecase updateQueueUsecase ;
  CheckinBloc(this.getAllQueuesUsecase, this.generateOrderUsecase, this.updateQueueUsecase, ):super(LoadingCheckinState()){

    on<FetchAllQueuesCheckinEvent>(
      _fetchAllQueues,
      transformer: restartable()
    );

    on<GenerateOrderCheckinEvent>(
      _generateOrder,
      transformer: restartable()
    );

    on<PrintOrderCheckinEvent>(
      _printOrder,
      transformer: restartable()
    );

  }

  _fetchAllQueues(FetchAllQueuesCheckinEvent event, Emitter<CheckinState> emit) async {
   
    await emit.onEach(getAllQueuesUsecase.call(), onData: (List<QueueEntity> data){
      emit(SuccessCheckinState(data));
    });
  }

  _generateOrder(GenerateOrderCheckinEvent event, Emitter<CheckinState> emit) async {
    final queue = generateOrderUsecase.call(event.queue);
    final order = queue.orders.last;
    updateQueueUsecase.call(queue);

    emit(GeneratedOrderCheckinState(order));
    await emit.onEach(getAllQueuesUsecase.call(), onData: (_){
    }
    );

  }

  _printOrder(PrintOrderCheckinEvent event, Emitter<CheckinState> emit){}
}