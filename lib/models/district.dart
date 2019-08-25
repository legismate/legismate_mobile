class District {
  final String name;

  District({this.name});

  factory District.fromJson(Map<String, dynamic> json) {
    return District(name: json['name']);
  }

  Map<String, dynamic> toJson() =>
      {
        'name': this.name,
      };
}