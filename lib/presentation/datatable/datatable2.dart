import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataTablePage22 extends StatefulWidget {
  const DataTablePage22({super.key});

  @override
  State<DataTablePage22> createState() => _DataTablePage22State();
}

class _DataTablePage22State extends State<DataTablePage22> {
  final MyData _data = MyData();
  String _filter = '';

  void _updateFilter(String value) {
    setState(() {
      _filter = value;
      _data.filterData(_filter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabla Profesional en Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Buscar',
              ),
              onChanged: _updateFilter,
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: PaginatedDataTable2(
                    header: Center(child: Text("My product")),
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 600,
                    columns: [
                      DataColumn2(label: Text("ID"), size: ColumnSize.S),
                      DataColumn2(label: Text("Name"), size: ColumnSize.M),
                      DataColumn2(label: Text("Price"), size: ColumnSize.L),
                    ],
                    source: _data,
                    rowsPerPage: 10,
                    autoRowsToHeight: true,
                    onRowsPerPageChanged: (rowsPerPage) {
                      // Opcional: Manejar el cambio de filas por página
                    },
                    sortColumnIndex: 0,
                    sortAscending: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  final List<Map<String, dynamic>> _allData = List.generate(2000, (index) => {
    "id": index,
    "title": "Item $index",
    "price": Random().nextInt(10000),
  });
  late List<Map<String, dynamic>> _filteredData;

  MyData() {
    _filteredData = List.from(_allData);
  }

  void filterData(String filter) {
    if (filter.isEmpty) {
      _filteredData = List.from(_allData);
    } else {
      _filteredData = _allData
          .where((data) =>
          data['title'].toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    final row = _filteredData[index];
    return DataRow(cells: [
      DataCell(Text(row['id'].toString())),
      DataCell(Text(row['title'])),
      DataCell(Text(row['price'].toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _filteredData.length;
  @override
  int get selectedRowCount => 0;
}