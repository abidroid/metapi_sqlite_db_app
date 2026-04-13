import 'package:first/pages/student_list_page.dart';
import 'package:flutter/material.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
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
                keyboardType: .number,
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

            ElevatedButton(onPressed:() {},style: ElevatedButton.styleFrom(
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
