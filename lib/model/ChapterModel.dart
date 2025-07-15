class Subchapter {
  final String title;
  final String content;

  Subchapter({required this.title, required this.content});

  factory Subchapter.fromJson(Map<String, dynamic> json) {
    return Subchapter(
      title: json['title'],
      content: json['content'],
    );
  }
}

class Chapter {
  final String title;
  final List<Subchapter> subchapters;

  Chapter({required this.title, required this.subchapters});

  factory Chapter.fromJson(Map<String, dynamic> json) {
    var subchaptersJson = json['subchapters'] as List;
    List<Subchapter> subchapterList =
        subchaptersJson.map((item) => Subchapter.fromJson(item)).toList();

    return Chapter(
      title: json['title'],
      subchapters: subchapterList,
    );
  }
}
