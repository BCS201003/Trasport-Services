class ProfileFieldModel {
  String fullName;
  String dateOfBirth;
  String country;
  String city;
  String address;
  String gender;
  String schoolCode;
  String studentGrade;
  String selectedSchoolList;
  String schoolType;
  String state;

  ProfileFieldModel({
    required this.fullName,
    required this.dateOfBirth,
    required this.country,
    required this.city,
    required this.address,
    required this.gender,
    required this.schoolCode,
    required this.studentGrade,
    required this.selectedSchoolList,
    required this.schoolType,
    required this.state,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'dateOfBirth': dateOfBirth,
      'country': country,
      'city': city,
      'address': address,
      'gender': gender,
      'schoolCode': schoolCode,
      'studentGrade': studentGrade,
      'selectedSchoolList': selectedSchoolList,
      'schoolType': schoolType,
      'state': state,
    };
  }
}
