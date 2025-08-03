// File: lib/model/TableOfContentModel.dart

class TableOfContent {
  final String title;
  final String content;

  TableOfContent({
    required this.title,
    required this.content,
  });

  factory TableOfContent.fromJson(Map<String, dynamic> json) {
    return TableOfContent(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
    };
  }
}
