// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

import 'work_experience_model.dart';
import 'contact_details_model.dart';
import 'education_model.dart';
import 'language_model.dart';

ProfileModel profileFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.occupation,
    this.name,
    this.description,
    this.contactDetails,
    this.languages,
    this.workExperience,
    this.education,
  });

  String occupation;
  String name;
  String description;
  ContactDetailsModel contactDetails;
  Map<String, LanguageModel> languages;
  Map<String, WorkExperienceModel> workExperience;
  Map<String, EducationModel> education;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        occupation: json["occupation"],
        name: json["name"],
        description: json["description"],
        contactDetails: ContactDetailsModel.fromJson(json["contact_details"]),
        languages: Map.from(json["languages"]).map((k, v) =>
            MapEntry<String, LanguageModel>(k, LanguageModel.fromJson(v))),
        workExperience: Map.from(json["work_experience"]).map((k, v) =>
            MapEntry<String, WorkExperienceModel>(
                k, WorkExperienceModel.fromJson(v))),
        education: Map.from(json["education"]).map((k, v) =>
            MapEntry<String, EducationModel>(k, EducationModel.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "occupation": occupation,
        "name": name,
        "description": description,
        "contact_details": contactDetails.toJson(),
        "languages": Map.from(languages)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "work_experience": Map.from(workExperience)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "education": Map.from(education)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}
