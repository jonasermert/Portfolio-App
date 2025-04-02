class Project {
  final String title;
  final String description;
  final int stars;
  final String language;
  final String url;

  Project({
    required this.title,
    required this.description,
    required this.stars,
    required this.language,
    required this.url,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['name'],
      description: json['description'] ?? 'Keine Beschreibung',
      stars: json['stargazerCount'],
      language: json['primaryLanguage']?['name'] ?? 'Unbekannt',
      url: json['url'],
    );
  }
}
