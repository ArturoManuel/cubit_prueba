import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';


import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CustomDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dropdownProvider = Provider.of<DropdownProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            hint: const Text(
              'Select Country',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            items: dropdownProvider.countries.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
            value: dropdownProvider.selectedCountry,
            onChanged: (String? newValue) {
              if (newValue != null) {
                dropdownProvider.setSelectedCountry(newValue);
              }
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 200,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              offset: const Offset(0, -5),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              iconEnabledColor: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 20),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            hint: const Text(
              'Select State',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            items: dropdownProvider.selectedCountry == null
                ? []
                : dropdownProvider.states[dropdownProvider.selectedCountry]!
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
            value: dropdownProvider.selectedState,
            onChanged: (String? newValue) {
              if (newValue != null) {
                dropdownProvider.setSelectedState(newValue);
              }
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 200,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              offset: const Offset(0, -5),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              iconEnabledColor: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: dropdownProvider.canLoadContent
              ? () {
            dropdownProvider.loadContent();
          }
              : null,
          child: const Text('Filtrar'),
        ),
      ],
    );
  }
}




