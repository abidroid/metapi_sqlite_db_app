
import 'package:first/db/database_helper.dart';
import 'package:flutter/material.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students List'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>
        (future: DatabaseHelper.instance.getAllStudents(),
          builder: (context, snapshot){
        if( snapshot.hasData){

          return Center(child: Text(snapshot.data!.length.toString()));
        }else{
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
