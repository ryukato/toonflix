import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_details_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final WebtoonModel webtoon;

  const DetailScreen({
    super.key,
    required this.webtoon,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailsModel> webtoonDetails;
  late Future<List<WebtoonEpisodeModel>> webtoonEpisodes;
  @override
  void initState() {
    super.initState();
    webtoonDetails = ApiService().getWebtoonDetails(widget.webtoon.id);
    webtoonEpisodes = ApiService().getWebtoonEpisodes(widget.webtoon.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.webtoon.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 40,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.webtoon.id,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(10, 10),
                            color: Colors.black.withOpacity(0.3),
                          )
                        ],
                      ),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Image.network(
                        widget.webtoon.thumb,
                        headers: const {
                          "User-Agent":
                              "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              buildWebToonDetails(),
              const SizedBox(
                height: 10,
              ),
              buildEpisodes(widget.webtoon.id)
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<WebtoonEpisodeModel>> buildEpisodes(String webtoonId) {
    return FutureBuilder(
        future: webtoonEpisodes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                for (var episode in snapshot.data!)
                  Episode(
                    episode: episode,
                    webtoonId: webtoonId,
                  )
              ],
            );
          } else {
            return const Text('No episodes');
          }
        });
  }

  FutureBuilder<WebtoonDetailsModel> buildWebToonDetails() {
    return FutureBuilder(
        future: webtoonDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Text(
                  snapshot.data!.about,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${snapshot.data!.genre}/${snapshot.data!.age}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            );
          } else {
            return const Text('...');
          }
        });
  }
}

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.webtoonId,
  });

  final WebtoonEpisodeModel episode;
  final String webtoonId;

  void onButtonTap() async {
    final url = Uri.parse(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              offset: const Offset(10, 10),
              color: Colors.black.withOpacity(0.3),
            )
          ],
          color: Colors.green.shade400,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
