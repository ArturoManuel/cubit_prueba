import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';
import '../provider.dart';


class CustomDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dropdownProvider = Provider.of<DropdownProvider>(context);
    double iconSize = MediaQuery.of(context).size.width *0.03; // Ajustar el tamaño del icono basado en el ancho de la pantalla

    iconSize = iconSize.clamp(16.0, 24.0); // Asegurar que el tamaño del icono esté entre 16 y 24

    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: DropdownButtonHideUnderline(
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
                    width: constraints.maxWidth / 3, // Ajusta según el ancho disponible
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
                    width: constraints.maxWidth / 3, // Ajusta según el ancho disponible
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
                  iconStyleData: IconStyleData(
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: iconSize,
                    iconEnabledColor: Colors.black,
                    iconDisabledColor: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: DropdownButtonHideUnderline(
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
                    width: constraints.maxWidth / 3, // Ajusta según el ancho disponible
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
                    width: constraints.maxWidth / 3, // Ajusta según el ancho disponible
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
                  iconStyleData: IconStyleData(
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: iconSize,
                    iconEnabledColor: Colors.black,
                    iconDisabledColor: Colors.grey,
                  ),
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
      },
    );
  }
}