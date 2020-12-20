class Credit {
  final int id;
  final String name;
  final String profilePath;

  Credit({
    this.id,
    this.name,
    this.profilePath,
  });

  factory Credit.fromJson(Map<String, dynamic> json) {
    return Credit(
      id: json['id'],
      name: json['name'],
      profilePath: json['profile_path'],
    );
  }
}
