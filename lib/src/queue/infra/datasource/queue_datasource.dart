
abstract class IQueueDataSource {
  Stream<List<Map>> getAllQueues();

  Future<void> addQueue(Map<String, dynamic> queue);
}