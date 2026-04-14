
class Student {

  String cnic;
  String name;
  String course;
  String lastQualification;
  String? mobile;

  Student({
    required this.cnic,
    required this.name,
    required this.course,
    required this.lastQualification,
    this.mobile,
});


  // fromMap


  // toMap
  Map<String, String?> toMap() {

    Map<String, String?> stdMap = {
      'cnic': cnic,
      'name': name,
      'course': course,
      'lastQualification': lastQualification,
      'mobile': mobile,
    };

    return stdMap;
  }
}