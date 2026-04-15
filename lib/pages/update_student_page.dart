import 'package:first/db/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/student.dart';

class UpdateStudentPage extends StatefulWidget {

  final Map<String, dynamic> student;

  const UpdateStudentPage({super.key, required this.student});

  @override
  State<UpdateStudentPage> createState() => _UpdateStudentPageState();
}

class _UpdateStudentPageState extends State<UpdateStudentPage> {

  var nameC = TextEditingController();
  var cnicC = TextEditingController();
  var courseC = TextEditingController();
  var lastQC = TextEditingController();
  var mobileC = TextEditingController();

  @override
  void initState() {

    nameC.text = widget.student['name'];
    cnicC.text = widget.student['cnic'];
    lastQC.text = widget.student['lastQualification'];
    courseC.text = widget.student['course'];
    mobileC.text = widget.student['mobile'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Student'),
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
                keyboardType: .number,
                enabled: false,
                decoration: InputDecoration(
                  labelText: "Enter your CNIC",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
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

            ElevatedButton(onPressed:() async{


              String name = nameC.text.trim();
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



              if( course.isEmpty ){
                Fluttertoast.showToast(msg: 'Please provide course');

                return;
              }

              if( lastQ.isEmpty){
                Fluttertoast.showToast(msg: 'Please provide Last Qualification');

                return;
              }


              Student student = Student(cnic: cnicC.text, name: name, course: course, lastQualification: lastQ, mobile: mobile);

              int updated = await DatabaseHelper.instance.updateStudentToDB(student);

              if( updated > 0 ){
                Fluttertoast.showToast(msg: 'Updated');
                Navigator.of(context).pop();
              }else{
                Fluttertoast.showToast(msg: 'Failed');

              }
            },style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyanAccent,
            ), child: Text("Update")),
            SizedBox(height: 20,),
          ],
        ),
      ))
      
    );
  }
}
