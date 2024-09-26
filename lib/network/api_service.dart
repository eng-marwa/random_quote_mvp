import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:random_quote_mvp/models/random_quote_model.dart';
import 'package:random_quote_mvp/network/api_exception.dart';

class ApiService {
  Future<RandomQuoteModel> fetchData() async {
    try {
      http.Response response =
          await http.get(Uri.parse('http://api.quotable.io/random'));
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        return RandomQuoteModel.fromJson(jsonData);
      } else {
        throw ApiException.fromJson(jsonData);
      }
    } on HttpException catch (e) {
      throw ApiException(0, e.toString());
    }
  }
}
