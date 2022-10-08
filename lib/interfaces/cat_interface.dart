import 'package:cat_app/models/cat_model.dart';

abstract class CatInterface{
  Future<CatModel?> getRandomCat();
}