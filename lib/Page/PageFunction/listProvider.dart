import 'package:flutter/material.dart';
import 'package:user_profile/Page/PageFunction/listModel.dart';
import 'package:flutter/cupertino.dart';

class ListProvider with ChangeNotifier {
  final List<UpdateModel> _updateList = [];

  List<UpdateModel> get updateList => _updateList;

  void addUpdate(UpdateModel update)  {
    _updateList.add(update);
    notifyListeners();
  }
}