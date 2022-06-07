import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/domain/value_objects/order.dart';

class QueueModel extends QueueEntity {
  QueueModel(
      {required id,
      required title,
      required abbreviation,
      required priority,
      required orders})
      : super(
            id: id,
            title: title,
            abbreviation: abbreviation,
            priority: priority,
            orders: orders);

  factory QueueModel.empty() => QueueModel(
        abbreviation: '',
        id: '',
        orders: <Order>[],
        priority: 0,
        title: '',
      );

  QueueModel copyWith({
    String? id,
    String? title,
    List<Order>? orders,
    String? abbreviation,
    int? priority,
  }) {
    return QueueModel(
      id: id ?? this.id,
      orders: orders ?? this.orders,
      priority: priority ?? this.priority,
      title: title ?? this.title,
      abbreviation: abbreviation ?? this.abbreviation,
    );
  }
}
