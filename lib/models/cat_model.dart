class CatModel {
  final String url;

  CatModel({required this.url});

  CatModel.fromJson(dynamic json) : url = json['url'] ?? '';
}
