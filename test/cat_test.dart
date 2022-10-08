import 'package:http/http.dart' as http;
import 'dart:convert' as json;

Future<String> getRandomCat(http.Client http) async {
  Uri url = Uri.parse('https://api.thecatapi.com/v1/images/search');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final Map triviaJSON = json.jsonDecode(response.body);
   return triviaJSON['url'];
  } else {
    return 'Failed to fetch cats';
  }
}