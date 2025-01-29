import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class UploadDocumentPage extends StatefulWidget {
  const UploadDocumentPage({super.key});

  @override
  UploadDocumentPageState createState() => UploadDocumentPageState();
}

class UploadDocumentPageState extends State<UploadDocumentPage> {
  File? _selectedFile;
  bool _isFileUploaded = false;

  final TextEditingController _cnicController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          _selectedFile = File(result.files.single.path!);
          _isFileUploaded = true;
        });

        print('File selected: ${_selectedFile!.path}');
      } else {
        setState(() {
          _isFileUploaded = false;
        });
      }
    } catch (e) {
      // Handle any errors
      print('Error picking file: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick file: $e')),
      );
    }
  }

  // Method to handle form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String cnic = _cnicController.text.trim();
      String fatherName = _fatherNameController.text.trim();
      // Retrieve more fields as needed

      // TODO: Implement form submission logic here
      // For example, send data along with the file to your backend

      print('CNIC: $cnic');
      print('Father\'s Name: $fatherName');
      // Print more fields as needed

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully!')),
      );

      // Optionally, clear the form
      setState(() {
        _selectedFile = null;
        _isFileUploaded = false;
        _cnicController.clear();
        _fatherNameController.clear();
        // Clear more controllers as needed
      });
    }
  }

  @override
  void dispose() {
    // Dispose controllers when not needed
    _cnicController.dispose();
    _fatherNameController.dispose();
    // Dispose more controllers as needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Define color scheme
    final Color primaryColor = Colors.black;
    final Color accentColor = Colors.white;
    final Color buttonColor = Colors.black;

    return Scaffold(
      appBar: CustomAppBar(title: 'Upload Document'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Upload File Button
                  ElevatedButton.icon(
                    onPressed: _pickFile,
                    icon: Icon(Icons.upload_file, color: accentColor),
                    label: Text(
                      'Upload Document',
                      style: TextStyle(color: accentColor, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Display selected file name
                  if (_selectedFile != null)
                    Card(
                      color: Colors.grey[100],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: Icon(Icons.insert_drive_file, color: primaryColor),
                        title: Text(
                          _selectedFile!.path.split('/').last,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _selectedFile = null;
                              _isFileUploaded = false;
                            });
                          },
                        ),
                      ),
                    ),

                  // Show additional input fields if file is uploaded
                  if (_isFileUploaded) ...[
                    SizedBox(height: 30),
                    // CNIC Field
                    TextFormField(
                      controller: _cnicController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.credit_card),
                        labelText: 'CNIC',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your CNIC';
                        }
                        // Add more validation if needed
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Father's Name Field
                    TextFormField(
                      controller: _fatherNameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Father\'s Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your father\'s name';
                        }
                        return null;
                      },
                    ),
                    // Add more TextFields as needed
                    SizedBox(height: 30),

                    // Submit Button
                    ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 16,color: Colors.white),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
