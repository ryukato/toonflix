import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtool_model.dart';

class ApiService {
  late final String baseUrl;
  final String today = 'today';

  ApiService() {
    baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  }

  Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse("$baseUrl/$today");
    final response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      final webtoons = (jsonDecode(response.body) as List<dynamic>)
          .map((webtoon) => WebtoonModel.fromJson(webtoon));

      return webtoons.toList();
    } else {
      throw Error();
    }
  }
}
