import 'package:first/db/database_helper.dart';
import 'package:first/models/student.dart';
import 'package:first/pages/student_list_page.dart';
import 'package:first/utils/formatters/cnic_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {

  var nameC = TextEditingController();
  var cnicC = TextEditingController();
  var courseC = TextEditingController();
  var lastQC = TextEditingController();
  var mobileC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: nameC,
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(Icons.camera),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(



                controller: cnicC,

                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // allow digits only
                  LengthLimitingTextInputFormatter(13),   // 5 + 7 + 1 + 2 dashes = 15
                  CnicFormatter(),
                ],
                decoration: InputDecoration(
                  labelText: "Enter your CNIC",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers),
                  suffixIcon: Icon(Icons.camera),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: lastQC,
                decoration: InputDecoration(
                  labelText: "Enter your Qualification",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(Icons.camera),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: courseC,
                decoration: InputDecoration(
                  labelText: "Enter your course",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(Icons.camera),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: mobileC,
                keyboardType: .phone,
                decoration: InputDecoration(
                  labelText: "Enter your Mobile",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                  suffixIcon: Icon(Icons.camera),
                ),
              ),
            ),

            SizedBox(height: 20,),

            ElevatedButton(onPressed:() async {
              String name = nameC.text.trim();
              String cnic = cnicC.text.trim();
              String course = courseC.text.trim();
              String lastQ = lastQC.text.trim();
              String mobile = mobileC.text.trim();

              // Validations
              // Front End
              if( name.isEmpty){
                // show Toast
                Fluttertoast.showToast(msg: 'Please provide name');
                return;
              }

              if( cnic.isEmpty){
                Fluttertoast.showToast(msg: 'Please provide CNIC');

                return;
              }

              if( cnic.length != 15){
                Fluttertoast.showToast(msg: 'Invalid CNIC number');
                return;
              }


              if( course.isEmpty ){
                Fluttertoast.showToast(msg: 'Please provide course');

                return;
              }

              if( lastQ.isEmpty){
                Fluttertoast.showToast(msg: 'Please provide Last Qualification');

                return;
              }


              Student student = Student(cnic: cnic, name: name, course: course, lastQualification: lastQ, mobile: mobile);

              Map<String, String?> stdMap = {
                'cnic': '93898398383398',
                'name': 'Test',
                'course': 'Mobile AD',
                'lastQualification': 'FA',
                'mobile': null,
              };
              // Send this student to DB and insert in Table

              DatabaseHelper dbHelper = DatabaseHelper.instance;
              int result = await dbHelper.saveStudentToDB(student);

              if( result > 0 ){
                Fluttertoast.showToast(msg: 'Saved');

                // Todo: clear all textfields
                // Todo: Navigate to student list page
              }else{
                Fluttertoast.showToast(msg: 'Failed');

              }

            },style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyanAccent,
            ), child: Text("Save")),


            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return StudentListPage();
              }));
            },style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyanAccent,
            ),  child: Text("View All")),
          ],
        ),
      ))
      
    );
  }
}
