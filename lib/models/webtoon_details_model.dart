class WebtoonDetailsModel {
  final String title;
  final String about;
  final String genre;
  final String age;

  WebtoonDetailsModel({
    required this.title,
    required this.about,
    required this.genre,
    required this.age,
  });

  factory WebtoonDetailsModel.fromJson(Map<String, dynamic> json) {
    return WebtoonDetailsModel(
      title: json['title'],
      about: json['about'],
      genre: json['genre'],
      age: json['age'],
    );
  }
}
