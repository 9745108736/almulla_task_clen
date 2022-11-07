import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

class TodoViewModel extends BaseViewModel {
  final taskNameTF = TextEditingController();
  final taskDateTF = TextEditingController();
  String? selectedDateTime = "";

  defualtDateTime() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yy kk:mm').format(now);
    selectedDateTime = formattedDate;
  }
}
