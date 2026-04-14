
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
         // return Center(child: Text(snapshot.data!.length.toString()));


          List<Map<String, dynamic>> students = snapshot.data!;


          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index){

                  Map<String, dynamic> student = students[index];

                  return Card(
                    color: Colors.amber[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: .start,
                        spacing: 16,
                        children: [
                          Text('CNIC: ${student['cnic']}'),
                          Text('Name: ${student['name']}'),
                          Text('Course: ${student['course']}'),
                          Text('Qual: ${student['lastQualification']}'),

                          Row(
                            spacing: 16,
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white
                                  ),

                                  onPressed: (){},
                                    label: Text('Delete'),
                                    icon: Icon(Icons.delete,),
                                ),
                              ),

                              Expanded(
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white
                                  ),

                                  onPressed: (){},
                                  label: Text('Update'),
                                  icon: Icon(Icons.edit),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );

            }),
          );

        }else{
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
