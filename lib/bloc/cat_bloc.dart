import 'package:cat_app/models/cat_model.dart';
import 'package:flutter/cupertino.dart';

import '../repository/cat_repository.dart';

class CatBloc with ChangeNotifier {
  bool loading = true;
  final catRepository = CatRepository();
  late CatModel? catModel;

  void generateRandomCat() {
    catRepository.getRandomCat().then((value) {
      if (value != null) {
        loading = false;
        catModel = value;
      }
      notifyListeners();
    });
  }

  void loadingCat() {
    loading = true;
    notifyListeners();
  }
}
