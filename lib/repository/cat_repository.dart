import 'package:cat_app/interfaces/cat_interface.dart';
import 'package:cat_app/models/cat_model.dart';
import 'package:cat_app/services/cat_service.dart';

class CatRepository {
  final CatInterface catInterface = CatService();

  Future<CatModel?> getRandomCat() {
    return catInterface.getRandomCat();
  }
}
