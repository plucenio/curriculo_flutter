class LanguageModel {
  LanguageModel({
    this.name,
    this.level,
  });

  String name;
  String level;

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        name: json["name"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "level": level,
      };
}
