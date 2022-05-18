import 'package:flutter_queue/src/queue/domain/value_objects/order.dart';
import 'package:flutter_queue/src/queue/infra/adapters/json_to_order.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Deve converter um map em um objeto do tipo Order', ()  {

    final order = JsonToOrder.fromMap({
      'id': 'any_id',
      'position': 1,
      'timestamp': '2022-05-18 17:19:40',
      'status': 'attending',
    });

    expect(order, isA<Order>());
  });

  test('Deve que order.status seja igual EOrderStatus.attending', ()  {

    final order = JsonToOrder.fromMap({
      'id': 'any_id',
      'position': 1,
      'timestamp': '2022-05-18 17:19:40',
      'status': 'attending',
    });

    expect(order.status, EOrderStatus.attending);
  });
}