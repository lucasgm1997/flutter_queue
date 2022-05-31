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

  test('Deve remover todas as orders de todas as queues', ( ) async {
    final firestore = FakeFirebaseFirestore();
    final datasource = QueueFirestoreDataSource(firestore);

    datasource.addQueue({
      'id': 'any_id',
      'title': 'any_title',
      'priority': 2,
      'abbreviation': 'abbr',
      'orders': [],
    });

    datasource.addQueue({
      'id': 'any_id_2',
      'title': 'any_title_2',
      'priority': 4,
      'abbreviation': 'abbr_2',
      'orders': [],
    });

    await datasource.removeAllOrders();

    final collectionReference = firestore.collection('queue');
    final queries = await collectionReference.get();

    expect(queries.docs.first.data().containsKey('orders'), false);
    expect(queries.docs.last.data().containsKey('orders'), false);

  });

  test('Deve atualizar a queue', ( ) async {
    final firestore = FakeFirebaseFirestore();
    final datasource = QueueFirestoreDataSource(firestore);

    datasource.addQueue({
      'id': 'any_id',
      'title': 'any_title',
      'priority': 2,
      'abbreviation': 'abbr',
      'orders': [],
    });

    await datasource.updateQueue({
      'id': 'any_id',
      'title': 'any_title',
      'priority': 2,
      'abbreviation': 'abbr',
      'orders': [
        {
          'position': 1,
          'id': '0001',
          'status': 'wainting' ,
          'timestamp': DateTime.now(),
        }
      ],
    });

    final collectionReference = firestore.collection('queue');

    final queue = await collectionReference.doc('any_id').get();
    expect(queue.data()?.containsKey('orders'), true );
    expect(queue.data()?['orders'][0]['status'], 'wainting' );


    

  });


}