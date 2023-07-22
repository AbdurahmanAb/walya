import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier {
  DateTime? _pickUpDate = null;
  DateTime? _dropDate = null;

  DateTime? get pdate => _pickUpDate;
  DateTime? get ddate => _dropDate;

  void addPDate(value) {
    _pickUpDate = value;
  }

  void addDdate(value) {
    _dropDate = value;
  }
}
