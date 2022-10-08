import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'cat_test.dart';

void main() {
  group('getRandomCat', () {
    test('return url when http response is successful', () async {
      // Mock the API call to return a json response with http status 200 Ok //
      final mockHTTPClient = MockClient((request) async {
        // Create sample response of the HTTP call //
        final response = {"code": '200'};
        return Response(jsonEncode(response), 200);
      });
      // Check whether getNumberTrivia function returns
      // number trivia which will be a String
      expect(await getRandomCat(mockHTTPClient), isA<String>());
    });

    test('return error message when http response is unsuccessful', () async {
      // Mock the API call to return an
      // empty json response with http status 404
      final mockHTTPClient = MockClient((request) async {
        final response = {};
        return Response(jsonEncode(response), 404);
      });
      expect(await getRandomCat(mockHTTPClient),
          'Failed to fetch random cat');
    });
  });
}
