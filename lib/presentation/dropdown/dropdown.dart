
import 'package:cubic_prueba/presentation/dropdown/provider.dart';
import 'package:cubic_prueba/presentation/dropdown/widget/customDropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomDropdown(),
            if (dropdownProvider.displayedCountry != null &&
                dropdownProvider.displayedState != null)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Selected: ${dropdownProvider
                      .displayedCountry} - ${dropdownProvider.displayedState}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
