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

  test('Deve adicionar um novo item a collection queue', ( ) async {
    final firestore = FakeFirebaseFirestore();
    final datasource = QueueFirestoreDataSource(firestore);

    datasource.addQueue({
      'id': 'any_id',
      'title': 'any_title',
      'priority': 2,
      'abbreviation': 'abbr',
    });

    final queueReference = firestore.collection('queue');
    final queries = await queueReference.get();
    expect(queries.docs.length, 1);
    expect(queries.docs[0]['title'], 'any_title');
    expect(queries.docs.first.data().containsKey('id'), false);

  });
}