import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_details_model.dart';
import 'package:toonflix/models/webtoon_model.dart';

import '../models/webtoon_episode_model.dart';

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

  Future<WebtoonDetailsModel> getWebtoonDetails(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      return WebtoonDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Error();
    }
  }

  Future<List<WebtoonEpisodeModel>> getWebtoonEpisodes(String id) async {
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      final webtoonEpisodes = (jsonDecode(response.body) as List<dynamic>)
          .map((webtoon) => WebtoonEpisodeModel.fromJson(webtoon));

      return webtoonEpisodes.toList();
    } else {
      throw Error();
    }
  }
}
