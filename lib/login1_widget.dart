import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';




enum CTOField { marketing, sales, executive }

class ProjectDetails {
  final String projectName;
  final String ctoName;
  final String startDate;
  final String description;
  final CTOField ctoField;
  final String visitDate;
  final String modifications;
  final String clientSuggestion;

  ProjectDetails({
    required this.projectName,
    required this.ctoName,
    required this.startDate,
    required this.description,
    required this.ctoField,
    required this.visitDate,
    required this.modifications,
    required this.clientSuggestion,
  });
}

class ProjectDetailsFormWidget extends StatefulWidget {
  @override
  _ProjectDetailsFormWidgetState createState() => _ProjectDetailsFormWidgetState();
}

class _ProjectDetailsFormWidgetState extends State<ProjectDetailsFormWidget> {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController ctoNameController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController visitDateController = TextEditingController();
  TextEditingController modificationsController = TextEditingController();
  TextEditingController clientSuggestionController = TextEditingController();
  CTOField? selectedCTOField;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Scrollbar(
          child:ListView(
          children: <Widget>[
            Text(
              'Project Name:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: projectNameController,
              decoration: InputDecoration(
                hintText: 'Enter project name',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'CTO Name:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: ctoNameController,
              decoration: InputDecoration(
                hintText: 'Enter CTO name',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Start Date:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: startDateController,
              decoration: InputDecoration(
                hintText: 'Enter start date',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Enter project description',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'CTO Field:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: <Widget>[
                Radio<CTOField>(
                  value: CTOField.marketing,
                  groupValue: selectedCTOField,
                  onChanged: (CTOField? value) {
                    setState(() {
                      selectedCTOField = value;
                    });
                  },
                ),
                Text('Marketing'),
                Radio<CTOField>(
                  value: CTOField.sales,
                  groupValue: selectedCTOField,
                  onChanged: (CTOField? value) {
                    setState(() {
                      selectedCTOField = value;
                    });
                  },
                ),
                Text('Sales'),
                Radio<CTOField>(
                  value: CTOField.executive,
                  groupValue: selectedCTOField,
                  onChanged: (CTOField? value) {
                    setState(() {
                      selectedCTOField = value;
                    });
                  },
                ),
                Text('Executive'),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Date of Visit:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: visitDateController,
              decoration: InputDecoration(
                hintText: 'Enter visit date',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Modifications:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: modificationsController,
              decoration: InputDecoration(
                hintText: 'Enter modifications',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Client Suggestion:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: clientSuggestionController,
              decoration: InputDecoration(
                hintText: 'Enter client suggestion',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Submit button
                ProjectDetails details = ProjectDetails(
                  projectName: projectNameController.text,
                  ctoName: ctoNameController.text,
                  startDate: startDateController.text,
                  description: descriptionController.text,
                  ctoField: selectedCTOField ?? CTOField.marketing,
                  visitDate: visitDateController.text,
                  modifications: modificationsController.text,
                  clientSuggestion: clientSuggestionController.text,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProjectDetailsDisplayWidget(details: details),
                  ),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
        ),
      ),
    );
  }
}

class ProjectDetailsDisplayWidget extends StatelessWidget {
  final ProjectDetails details;

  ProjectDetailsDisplayWidget({required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Scrollbar(
          child:ListView(
          children: <Widget>[
            Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text(
      'Project Name:',
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 5), 
    Text(
      '${details.projectName}',
      style: TextStyle(fontSize: 18.0),
    ),
    SizedBox(height: 20),
    Text(
      'CTO:',
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 5), 
    Text(
      '${details.ctoName}',
      style: TextStyle(fontSize: 18.0),
    ),
    SizedBox(height: 20),
    Text(
      'Start Date:',
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 5), 
    Text(
      '${details.startDate}',
      style: TextStyle(fontSize: 18.0),
    ),
    SizedBox(height: 20),
    Text(
      'Description:',
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 5), 
    Text(
      '${details.description}',
      style: TextStyle(fontSize: 18.0),
    ),
    SizedBox(height: 20),
    Text(
      'CTO Field:',
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 5), 
    Text(
      '${details.ctoField.toString().split('.').last}',
      style: TextStyle(fontSize: 18.0),
    ),
    SizedBox(height: 20),
    Text(
      'Date of Visit:',
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 5), 
    Text(
      '${details.visitDate}',
      style: TextStyle(fontSize: 18.0),
    ),
    SizedBox(height: 20),
    Text(
      'Modifications:',
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 5), // Add space between topic and text
    Text(
      '${details.modifications}',
      style: TextStyle(fontSize: 18.0),
    ),
    SizedBox(height: 20),
    Text(
      'Client Suggestion:',
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 5), // Add space between topic and text
    Text(
      '${details.clientSuggestion}',
      style: TextStyle(fontSize: 18.0),
    ),
  ],
),

            Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align buttons with equal space
  children: [
    ElevatedButton(
      onPressed: () {
        // Save button functionality
      },
      child: Text('Save'),
    ),
    ElevatedButton(
      onPressed: () {
        // Edit button functionality
        Navigator.pop(context); // Close the current screen
      },
      child: Text('Edit'),
    ),
    ElevatedButton(
      onPressed: () {
        // Report button functionality
        // Generate PDF report
        _generatePDFReport(context, details);
      },
      child: Text('Report'),
    ),
  ],
)

          ],
        ),
        ),
      ),
    );
  }

 void _generatePDFReport(BuildContext context, ProjectDetails details) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Project Name:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 5),
              pw.Text(details.projectName, style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 20),
              pw.Text('CTO:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 5),
              pw.Text(details.ctoName, style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 20),
              pw.Text('Start Date:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 5),
              pw.Text(details.startDate, style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 20),
              pw.Text('Description:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 5),
              pw.Text(details.description, style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 20),
              pw.Text('CTO Field:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 5),
              pw.Text(details.ctoField.toString().split('.').last, style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 20),
              pw.Text('Date of Visit:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 5),
              pw.Text(details.visitDate, style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 20),
              pw.Text('Modifications:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 5),
              pw.Text(details.modifications, style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 20),
              pw.Text('Client Suggestion:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 5),
              pw.Text(details.clientSuggestion, style: pw.TextStyle(fontSize: 18)),
            ],
          );
        },
      ),
    );

    // Display the generated PDF
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
  }
}
class Login1Widget extends StatefulWidget {
  @override
  _Login1WidgetState createState() => _Login1WidgetState();
}

class _Login1WidgetState extends State<Login1Widget> {
  String selectedUserType = '';
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Admin and CTO credentials
  final String adminUsername = 'Admin1';
  final String adminPassword = 'admin12345678';
  final String ctoUsername = 'CTO1';
  final String ctoPassword = 'cto12345678';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Select User Type:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Radio<String>(
                    value: 'Admin',
                    groupValue: selectedUserType,
                    onChanged: (value) {
                      setState(() {
                        selectedUserType = value!;
                      });
                    },
                  ),
                  Text('Admin'),
                  Spacer(),
                  Radio<String>(
                    value: 'Client',
                    groupValue: selectedUserType,
                    onChanged: (value) {
                      setState(() {
                        selectedUserType = value!;
                      });
                    },
                  ),
                  Text('Client'),
                  Spacer(),
                  Radio<String>(
                    value: 'CTO',
                    groupValue: selectedUserType,
                    onChanged: (value) {
                      setState(() {
                        selectedUserType = value!;
                      });
                    },
                  ),
                  Text('CTO'),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                'Enter Username:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              Text(
                'Enter Password:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (selectedUserType == 'Admin' &&
                        usernameController.text == adminUsername &&
                        passwordController.text == adminPassword) {
                      // Navigate to the project details page for Admin
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProjectDetailsFormWidget(),
                        ),
                      );
                    } else if (selectedUserType == 'CTO' &&
                        usernameController.text == ctoUsername &&
                        passwordController.text == ctoPassword) {
                      // Navigate to the project details page for CTO
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProjectDetailsFormWidget(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid username or password')),
                      );
                    }
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




void main() {
  runApp(MaterialApp(
    home: Login1Widget(),
  ));
}


