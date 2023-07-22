import 'package:flutter/material.dart';
import '../model/location_model.dart';

class CountryProvder extends ChangeNotifier {
  var _selectedLocation = <Address>[];
  var _dropLocation = <Address>[];
  var _pickUpCountry = '';
  var _dropCountry = '';

  String get pcountry => _pickUpCountry;
  String get dcountry => _dropCountry;
  List<Address> get items => _selectedLocation;
  List<Address> get drop => _dropLocation;

  void addPCountry(value) {
    _pickUpCountry = value;
  }

  void removePCountry() {
    _pickUpCountry = '';
  }

  void addDCountry(value) {
    _dropCountry = value;
  }

  void removeDCountry() {
    _dropCountry = '';
  }

  void addLocation(value) {
    _selectedLocation.add(value);
    notifyListeners();
  }

  void removeAll() {
    _selectedLocation.clear();
  }

  void dropLocation(value) {
    _dropLocation.add(value);
    notifyListeners();
  }

  void removeDrop() {
    _dropLocation.clear();
  }
}
