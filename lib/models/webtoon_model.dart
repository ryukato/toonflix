class WebtoonModel {
  final String title;
  final String thumb;
  final String id;

  WebtoonModel({
    required this.title,
    required this.thumb,
    required this.id,
  });

  factory WebtoonModel.fromJson(Map<String, dynamic> json) {
    return WebtoonModel(
        title: json['title'], thumb: json['thumb'], id: json['id']);
  }

  @override
  String toString() {
    return 'WebtoonModel - id: $id, title: $title, thumb:$thumb';
  }
}
