class Folder {
  final String title;
  final List<Child> subchapters;

  Folder({required this.title, required this.subchapters});

  factory Folder.fromJson(Map<String, dynamic> json) {
    return Folder(
      title: json['title'] ?? '',
      subchapters: (json['subchapters'] as List<dynamic>)
          .map((e) => Child.fromJson(e))
          .toList(),
    );
  }
}

class Child {
  final String title;
  final List<Pic> pics;

  Child({required this.title, required this.pics});

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
      title: json['title'] ?? '',
      pics:
          (json['pics'] as List<dynamic>).map((e) => Pic.fromJson(e)).toList(),
    );
  }
}

class Pic {
  final String title;
  final String path;

  Pic({required this.title, required this.path});

  factory Pic.fromJson(Map<String, dynamic> json) {
    return Pic(
      title: json['title'] ?? '',
      path: json['path'] ?? '',
    );
  }
}
