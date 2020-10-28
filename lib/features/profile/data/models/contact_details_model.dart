class ContactDetailsModel {
  ContactDetailsModel({
    this.email,
    this.phone,
    this.linkedin,
  });

  String email;
  String phone;
  String linkedin;

  factory ContactDetailsModel.fromJson(Map<String, dynamic> json) =>
      ContactDetailsModel(
        email: json["email"],
        phone: json["phone"],
        linkedin: json["linkedin"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
        "linkedin": linkedin,
      };
}
