class User {
  String? citizenship;
  String? fullName;
  String? nik;
  DateTime? dateOfBirth;
  String? email;
  String? phone;

  User(
      {this.citizenship,
      this.fullName,
      this.nik,
      this.dateOfBirth,
      this.email,
      this.phone});

  User.fromJson(Map<String, dynamic> json) {
    citizenship = json['citizenship'];
    fullName = json['full_name'];
    nik = json['NIK'];
    dateOfBirth = json['date_of_birth'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['citizenship'] = citizenship;
    data['full_name'] = fullName;
    data['NIK'] = nik;
    data['date_of_birth'] = dateOfBirth;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
