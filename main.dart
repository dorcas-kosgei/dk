import 'package:flutter/material.dart';

void main() {
  runApp(StudentApp());
}

class StudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Management App',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

// LOGIN PAGE
class LoginPage extends StatelessWidget {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: username,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Login"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// DASHBOARD
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Center(
        child: ElevatedButton(
          child: Text("Register Student"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegistrationPage()),
            );
          },
        ),
      ),
    );
  }
}

// REGISTRATION PAGE
class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController courseController = TextEditingController();

  List<String> students = [];

  void saveStudent() {
    setState(() {
      students.add("${nameController.text} - ${courseController.text}");
    });

    nameController.clear();
    courseController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Registration")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Student Name"),
            ),
            TextField(
              controller: courseController,
              decoration: InputDecoration(labelText: "Course"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: saveStudent, child: Text("Save Student")),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(students[index]));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
