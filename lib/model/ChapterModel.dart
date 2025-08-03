class Subchapter {
  final String title;
  final String content;
  final List<Subchapter> subchapters;

  Subchapter({
    required this.title,
    required this.content,
    this.subchapters = const [],
  });

  factory Subchapter.fromJson(Map<String, dynamic> json) {
    var subSubChaptersJson = json['subchapters'] as List?;
    List<Subchapter> subSubChapterList = subSubChaptersJson != null
        ? subSubChaptersJson.map((item) => Subchapter.fromJson(item)).toList()
        : [];

    return Subchapter(
      title: json['title'],
      content: json['content'],
      subchapters: subSubChapterList,
    );
  }
}

class Chapter {
  final String? id;
  final String title;
  final List<Subchapter> subchapters;

  Chapter({
    this.id,
    required this.title,
    required this.subchapters,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    var subchaptersJson = json['subchapters'] as List;
    List<Subchapter> subchapterList =
        subchaptersJson.map((item) => Subchapter.fromJson(item)).toList();

    return Chapter(
      id: json['id'],
      title: json['title'],
      subchapters: subchapterList,
    );
  }
}
