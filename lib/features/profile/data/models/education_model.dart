class EducationModel {
  EducationModel({
    this.university,
    this.title,
    this.startDate,
    this.endDate,
  });

  String title;
  String university;
  String startDate;
  String endDate;

  factory EducationModel.fromJson(Map<String, dynamic> json) => EducationModel(
        title: json["title"],
        university: json["university"],
        startDate: json["start_date"],
        endDate: json["end_date"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "university": university,
        "start_date": startDate,
        "end_date": endDate,
      };
}
