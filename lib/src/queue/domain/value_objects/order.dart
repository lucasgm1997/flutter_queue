class Order {
  final String id;
  final int position;
  final DateTime timestamp;
  final EOrderStatus status;

  Order(
      {required this.position,
      required this.id,
      required this.timestamp,
      required this.status});
}

enum EOrderStatus {
  wainting,
  attending,
  notAnswered,
}
