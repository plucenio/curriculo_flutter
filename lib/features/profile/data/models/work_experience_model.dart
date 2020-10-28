class WorkExperienceModel {
  WorkExperienceModel({
    this.company,
    this.title,
    this.startDate,
    this.endDate,
    this.description,
    this.location,
  });

  String company;
  String title;
  String startDate;
  String endDate;
  String description;
  String location;

  factory WorkExperienceModel.fromJson(Map<String, dynamic> json) =>
      WorkExperienceModel(
        company: json["company"],
        title: json["title"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        description: json["description"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "company": company,
        "title": title,
        "start_date": startDate,
        "end_date": endDate,
        "description": description,
        "location": location,
      };
}
