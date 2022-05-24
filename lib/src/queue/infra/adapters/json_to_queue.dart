import 'package:flutter_queue/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_queue/src/queue/infra/adapters/json_to_order.dart';

class JsonToQueue {
  static QueueEntity fromMap(Map json){

    return QueueEntity(id: json['id'], 
      title: json['title'],
      abbreviation: json['abbreviation'],
      priority: json['priority'],
      orders: [
        if (json.containsKey('orders'))
          ...(json['orders'] as List).map( JsonToOrder.fromMap).toList(),
      ],
    );
  }

  static Map<String, dynamic> toMap(QueueEntity queueEntity){
    return {
      'id': queueEntity.id,
      'title': queueEntity.title,
      'abbreviation': queueEntity.abbreviation,
      'priority': queueEntity.priority,
      'orders': queueEntity.orders.map((order) => JsonToOrder.toMap(order)).toList(),
    };
  }
}