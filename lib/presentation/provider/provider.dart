import 'package:cubic_prueba/presentation/provider/providerinfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProvidePage extends StatelessWidget {
  const ProvidePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextProvider watch = context.watch<TextProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provide Page'),
      ),
      body: ListView(
        children: [
          Text(watch.text1),
          Text(watch.text2),
          ElevatedButton(
            onPressed: () {
              context.read<TextProvider>().setText(
                value1: "Nuevo Texto 1",
                value2: "Nuevo Texto 2",
              );
            },
            child: const Text("New Texts"),
          ),
        ],
      ),
    );
  }
}

