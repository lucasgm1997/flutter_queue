import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_queue/src/configuration/configuration_module.dart';
import 'package:flutter_queue/src/configuration/pages/configuration_page.dart';
import 'package:flutter_queue/src/queue/queue_module.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...queueModule,
        ...configurationModule,
      ],
      child: MaterialApp(
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        home: ConfigurationPage(),
      ),
    );
  }
}