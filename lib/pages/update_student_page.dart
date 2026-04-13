import 'package:flutter/material.dart';

class UpdateStudentPage extends StatefulWidget {
  const UpdateStudentPage({super.key});

  @override
  State<UpdateStudentPage> createState() => _UpdateStudentPageState();
}

class _UpdateStudentPageState extends State<UpdateStudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // SizedBox.expand(
          //   child: Image.asset("images/pics/rendara_create.png",fit: BoxFit.cover,),
          // ),

          SafeArea(child: Padding(
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
                      prefixIcon: Icon(Icons.person),
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
                ), child: Text("Update")),
                SizedBox(height: 20,),
              ],
            ),
          ))
        ],
      )
      
    );
  }
}
