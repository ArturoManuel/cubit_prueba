import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class DataTablePage extends StatefulWidget {
  const DataTablePage({super.key});

  @override
  State<DataTablePage> createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {
  final MyData _data = MyData();
  String _filter = '';
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  void _updateFilter(String value) {
    setState(() {
      _filter = value;
      _data.filterData(_filter);
    });
  }

  void _sort<T>(Comparable<T> Function(Map<String, dynamic> d) getField, int columnIndex, bool ascending) {
    _data.sort(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
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
                fillColor: Theme.of(context).cardColor,
                filled: true,
              ),
              onChanged: _updateFilter,
            ),
            SizedBox(height: 16),
            Expanded(
              child: PaginatedDataTable2(
                header: Center(child: Text("My product")),
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                columns: [
                  DataColumn2(
                    label: Text("ID"),
                    size: ColumnSize.S,
                    onSort: (columnIndex, ascending) => _sort<num>((d) => d['id'], columnIndex, ascending),
                  ),
                  DataColumn2(
                    label: Text("Name"),
                    size: ColumnSize.M,
                    onSort: (columnIndex, ascending) => _sort<String>((d) => d['title'], columnIndex, ascending),
                  ),
                  DataColumn2(
                    label: Text("Price"),
                    size: ColumnSize.L,
                    onSort: (columnIndex, ascending) => _sort<num>((d) => d['price'], columnIndex, ascending),
                  ),
                  DataColumn2(
                    label: Text("Fecha"),
                    size: ColumnSize.M,
                    onSort: (columnIndex, ascending) => _sort<DateTime>((d) => d['date'], columnIndex, ascending),
                  ),
                ],
                source: _data,
                rowsPerPage: 10,
                autoRowsToHeight: true,
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
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
    "date": DateTime.now().subtract(Duration(days: Random().nextInt(1000))),
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

  void sort<T>(Comparable<T> Function(Map<String, dynamic> d) getField, bool ascending) {
    _filteredData.sort((a, b) {
      if (!ascending) {
        final temp = a;
        a = b;
        b = temp;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    final row = _filteredData[index];
    return DataRow(cells: [
      DataCell(Text(row['id'].toString())),
      DataCell(Text(row['title'])),
      DataCell(Text(row['price'].toString())),
      DataCell(Text(row['date'].toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _filteredData.length;
  @override
  int get selectedRowCount => 0;
}