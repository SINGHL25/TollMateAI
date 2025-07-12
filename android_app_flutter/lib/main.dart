```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TollMateAI Native',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: UploadScreen(),
    );
  }
}

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? _selectedFile;
  String _result = '';

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['xlsx']);
    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadFile(String endpoint) async {
    if (_selectedFile == null) return;
    final uri = Uri.parse('http://your-fastapi-ip:9000/model/$endpoint');
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('file', _selectedFile!.path));

    final streamed = await request.send();
    final response = await http.Response.fromStream(streamed);

    setState(() {
      _result = jsonEncode(json.decode(response.body));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TollMateAI Native UI")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _pickFile,
              child: Text("Select Excel File (.xlsx)"),
            ),
            SizedBox(height: 10),
            if (_selectedFile != null) Text("Selected: ${_selectedFile!.path}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _uploadFile('fraud-detection'),
              child: Text("Run Fraud Detection"),
            ),
            ElevatedButton(
              onPressed: () => _uploadFile('traffic-density'),
              child: Text("Predict Traffic Density"),
            ),
            SizedBox(height: 20),
            Text("Result:", style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_result),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
