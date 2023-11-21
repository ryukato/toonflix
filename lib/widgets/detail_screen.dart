import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_details_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

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
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
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
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Image.network(
                      widget.webtoon.thumb,
                      headers: const {
                        "User-Agent":
                            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          buildWebToonDetails()
        ],
      ),
    );
  }

  FutureBuilder<WebtoonDetailsModel> buildWebToonDetails() {
    return FutureBuilder(
        future: webtoonDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
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
              ),
            );
          } else {
            return const Text('...');
          }
        });
  }
}
