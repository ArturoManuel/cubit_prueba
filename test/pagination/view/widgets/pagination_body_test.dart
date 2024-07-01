// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cubic_prueba/presentation/pagination/pagination.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PaginationBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => PaginationCubit(),
          child: MaterialApp(home: PaginationBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
