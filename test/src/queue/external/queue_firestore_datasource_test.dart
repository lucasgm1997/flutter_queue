import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_queue/src/queue/external/queue_firestore_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Deve retornar uma stream de map do firebase ', () async {
    final firestore = FakeFirebaseFirestore();

    await firestore.collection('queue').add(
      {
        'id': 'any_id',
        'title': 'any_title',
        'priority': 1,
        'abbreviation': 'abbr',
        'orders': [
          {
            'id': 'dfsdfsd',
            'position': 1,
            'status': 'attending',
            'timestamp': '2022-03-31 18:37:30',
          },
        ],
      }
    );
 
    final datasource = QueueFirestoreDataSource(firestore);
    final result = datasource.getAllQueues();

    expect(result, emits(isA<List<Map>>()));
  });
}