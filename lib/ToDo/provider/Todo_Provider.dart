import 'package:flutter/material.dart';

import '../model/Todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModal> Data = [];

  void addData(TodoModal datam) {
    Data.add(datam);
    notifyListeners();
  }

  void deleteData(int index) {
    Data.removeAt(index);
    notifyListeners();
  }

  void updateData(TodoModal datam, int index) {
    Data[index] = datam;
    notifyListeners();
  }
}