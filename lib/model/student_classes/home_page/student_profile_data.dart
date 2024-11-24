class StudentProfileData {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? admissionTime;
  String? rollNumber;
  String? program;
  double? cgpa;
  bool? isGraduated;
  bool? isDropout;
  String? fatherName;
  String? fatherOccupation;
  String? guardianName;
  String? guardianOccupation;
  String? dateOfBirth;
  String? nic;
  String? bloodGroup;

  StudentProfileData(
      {this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.admissionTime,
      this.rollNumber,
      this.program,
      this.cgpa,
      this.isGraduated,
      this.isDropout,
      this.fatherName,
      this.fatherOccupation,
      this.guardianName,
      this.guardianOccupation,
      this.dateOfBirth,
      this.nic,
      this.bloodGroup});

  StudentProfileData.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    admissionTime = json['admission_time'];
    rollNumber = json['roll_number'];
    program = json['program'];
    cgpa = json['cgpa'];
    isGraduated = json['is_graduated'];
    isDropout = json['is_dropout'];
    fatherName = json['father_name'];
    fatherOccupation = json['father_occupation'];
    guardianName = json['guardian_name'];
    guardianOccupation = json['guardian_occupation'];
    dateOfBirth = json['date_of_birth'];
    nic = json['nic'];
    bloodGroup = json['blood_group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['admission_time'] = admissionTime;
    data['roll_number'] = rollNumber;
    data['program'] = program;
    data['cgpa'] = cgpa;
    data['is_graduated'] = isGraduated;
    data['is_dropout'] = isDropout;
    data['father_name'] = fatherName;
    data['father_occupation'] = fatherOccupation;
    data['guardian_name'] = guardianName;
    data['guardian_occupation'] = guardianOccupation;
    data['date_of_birth'] = dateOfBirth;
    data['nic'] = nic;
    data['blood_group'] = bloodGroup;
    return data;
  }
}
