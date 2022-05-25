import 'package:flutter/material.dart';
import 'package:flutter_queue/src/configuration/blocs/conf_bloc.dart';
import 'package:flutter_queue/src/configuration/configuration_state.dart';
import 'package:flutter_queue/src/configuration/events/configuration_event.dart';
import 'package:flutter_queue/src/configuration/models/queue_model.dart';
import 'package:provider/provider.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> with CompleteStateMixin {

  @override
  void completeState() {
    context.read<ConfigurationBloc>().add(FetchQueuesConfigurationEvent());
  }

  void _addNewQueueDialog(){
    showDialog(context: context, builder: (context){
      var queue = QueueModel.empty();

      return AlertDialog(
        title: const Text('Nova fila'),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: const Text('Cancelar')),
          TextButton(onPressed: (){
            context.read<ConfigurationBloc>().add(AddNewQueueConfigurationEvent(queue));
            Navigator.of(context).pop();
          }, child: const Text('Adicionar')),
        ],
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label:  Text('Título'),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value){
                  queue = queue.copyWith(title: value);
                },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                decoration: const InputDecoration(
                  label:  Text('Abreviação'),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value){
                  queue = queue.copyWith(abbreviation: value);
                },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                decoration: const InputDecoration(
                  label:  Text('Prioridade'),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value){
                queue = queue.copyWith(priority: int.tryParse(value));
              },
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    final bloc = context.watch<ConfigurationBloc>();
    final state = bloc.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuração'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                      const Text('Filas'),
                      const Spacer(),
                      IconButton(
                      onPressed: _addNewQueueDialog,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                if (state is LoadedConfigurationState)
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.queues.length,
                      itemBuilder: (context, index) {
                        final queue = state.queues[index];
                        return ListTile(
                          title: Text('${queue.title} - ${queue.abbreviation}'),
                          subtitle: Text('${queue.priority} de prioridade'),
                          trailing:  IconButton(
                            onPressed: (){
                               context.read<ConfigurationBloc>().add(RemoveQueueConfigurationEvent(queue));
                              print(queue.id);
                            },
                            color: Colors.red,
                            
                            icon: const Icon(Icons.remove,),
                          ),
                        );
                      }),
                const Divider(),
                const Text('Controle', style: TextStyle(fontSize: 18),),
                const SizedBox(height: 10,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black,),
                    child: const Text('Reiniciar filas'),
                    onPressed: () {
                      bloc.add(RemoveAllOrdersConfigurationEvent());
                    },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  
}


mixin CompleteStateMixin <T extends StatefulWidget> on State<T> {

  void completeState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      completeState();
    });
  }
}