import 'package:cubic_prueba/presentation/dropdown/provider.dart';
import 'package:cubic_prueba/presentation/dropdown/widget/customDropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DropdownMenuExample extends StatelessWidget {
  const DropdownMenuExample({super.key});

  @override
  Widget build(BuildContext context) {
    final dropdownProvider = Provider.of<DropdownProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('DropdownButton2 Demo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomDropdown(),
            ),
            if (dropdownProvider.displayedCountry != null &&
                dropdownProvider.displayedState != null)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Selected: ${dropdownProvider.displayedCountry} - ${dropdownProvider.displayedState}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10, // Ejemplo de 10 elementos en la lista
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                color: Colors.blue,
                child: Center(child: Text('Componente adicional 1')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                color: Colors.green,
                child: Center(child: Text('Componente adicional 2')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                color: Colors.orange,
                child: Center(child: Text('Componente adicional 3')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
