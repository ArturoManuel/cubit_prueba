
import 'package:flutter/material.dart';

import 'datatable.dart';

class MultiBlockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página con Múltiples Bloques'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bloque 1
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Bloque 1: Información General',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            // Bloque 2
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Bloque 2: Más Información',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            // Bloque 3: Tabla con Buscador
            Container(
              height: 600,
              padding: EdgeInsets.all(16),
              child: DataTablePage(),
            ),
            // Bloque 4
            Container(
              height: 1000,
              padding: EdgeInsets.all(16),
              child: Text(
                'Bloque 4: Información Adicional',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}