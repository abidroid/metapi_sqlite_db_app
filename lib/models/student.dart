
class Student {

  // data members, attributes,
  String cnic;
  String name;
  String course;
  String lastQualification;
  String? mobile;

  // constructor
  // parameterized constructor
  // named parameters
  Student({
    required this.cnic,
    required this.name,
    required this.course,
    required this.lastQualification,
    this.mobile,
});


  // fromMap


  // toMap
  // will convert Student object to Map
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