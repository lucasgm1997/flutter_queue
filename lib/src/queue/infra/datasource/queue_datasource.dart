abstract class IQueueDataSource {
  Stream<List<Map>> getAllQueues();

  Future<void> addQueue(Map<String, dynamic> queue);

  Future<void> removeQueue(String id);

  Future<void> removeAllOrders();

  Future<void> updateQueue(Map<String, dynamic> queue);
}
