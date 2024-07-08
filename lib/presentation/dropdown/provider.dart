import 'package:flutter/material.dart';
class DropdownProvider with ChangeNotifier {
  final List<String> countries = ['Argentina', 'Brazil', 'Canada', 'Denmark'];
  final Map<String, List<String>> states = {
    'Argentina': ['Buenos Aires', 'Córdoba', 'Santa Fe'],
    'Brazil': ['São Paulo', 'Rio de Janeiro', 'Bahia'],
    'Canada': ['Ontario', 'Quebec', 'British Columbia'],
    'Denmark': ['Hovedstaden', 'Sjælland', 'Syddanmark'],
  };
  String? selectedCountry;
  String? selectedState;
  String? displayedCountry;
  String? displayedState;
  bool canLoadContent = false;
  DropdownProvider() {
    selectedCountry = 'Argentina';
    selectedState = 'Buenos Aires';
    loadContent();
  }

  void setSelectedCountry(String value) {
    selectedCountry = value;
    selectedState = null;  // Reset state selection
    canLoadContent = false;
    notifyListeners();
  }

  void setSelectedState(String value) {
    selectedState = value;
    canLoadContent = selectedCountry != null && selectedState != null;
    notifyListeners();
  }

  void clearSelection() {
    selectedCountry = null;
    selectedState = null;
    canLoadContent = false;
    notifyListeners();
  }

  void loadContent() {
    displayedCountry = selectedCountry;
    displayedState = selectedState;
    notifyListeners();
  }
}




