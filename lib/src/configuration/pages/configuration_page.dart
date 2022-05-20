import 'package:flutter/material.dart';
import 'package:flutter_queue/src/configuration/blocs/conf_bloc.dart';
import 'package:flutter_queue/src/configuration/conf_state.dart';
import 'package:provider/provider.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ConfBloc>();
    // Widget list = Container();
    final state = bloc.state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Configuração'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(18),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Filas'),
                  Spacer(),
                  const Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                ],
              ),
              if (state is LoadedConfState)
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.queues.length,
                    itemBuilder: (context, index) {
                      final queue = state.queues[index];
                      return ListTile(
                        title: Text('${queue.title} - ${queue.abbreviation}'),
                        subtitle: Text('${queue.priority} de prioridade'),
                        trailing: const Icon(
                          Icons.remove,
                          color: Colors.red,
                        ),
                      );
                    }),
              Divider(),
              const Text('Controle', style: TextStyle(fontSize: 18),),
              SizedBox(height: 10,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black,),
                  child: const Text('Reiniciar filas'),
                  onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
