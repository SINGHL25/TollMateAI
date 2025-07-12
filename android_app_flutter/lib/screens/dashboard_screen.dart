
```dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../services/api_client.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  File? _selectedFile;
  String _result = '';
  final apiClient = ApiClient(baseUrl: 'http://your-fastapi-ip:9000');

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['xlsx']);
    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadAndAnalyze(String endpoint) async {
    if (_selectedFile == null) return;
    final response = await apiClient.uploadFile(_selectedFile!, endpoint);
    setState(() {
      _result = response.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard UI")),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _uploadAndAnalyze('fraud-detection'),
                  child: Text("Fraud Check"),
                ),
                ElevatedButton(
                  onPressed: () => _uploadAndAnalyze('traffic-density'),
                  child: Text("Traffic Density"),
                ),
              ],
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
