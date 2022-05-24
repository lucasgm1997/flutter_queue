import 'package:flutter_queue/src/queue/infra/datasource/queue_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QueueFirestoreDataSource implements IQueueDataSource {
  final FirebaseFirestore firestore;

  QueueFirestoreDataSource(this.firestore);

  @override
  Stream<List<Map>> getAllQueues() {
    final collectionReference = firestore.collection('queue');
    final snapshotQueue = collectionReference.orderBy('priority', descending: true).snapshots();

    return snapshotQueue.map((event) => event.docs).map(_convert);
  }

  List<Map> _convert(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    return docs.map((document) {
      return {'id': document.id, ...document.data()};
    }).toList();
  }

  @override
  Future<void> addQueue(Map<String, dynamic> queue) async {
    final collectionReference = firestore.collection('queue');
    queue.remove('id');

    collectionReference.add(queue);
  }
  
  @override
  Future<void> removeQueue(String id) async {
    final collectionReference = firestore.collection('queue');

      await collectionReference.doc(id).delete();
    }
}
