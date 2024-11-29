class FacultyProfileData {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  FacultyProfileData(
      {this.username, this.firstName, this.lastName, this.email, this.phone});

  FacultyProfileData.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}
