import 'package:flutter/material.dart';

class StudentListContainer extends StatefulWidget {
  const StudentListContainer({super.key});

  @override
  StudentListContainerState createState() => StudentListContainerState();
}

class StudentListContainerState extends State<StudentListContainer> {
  final List<Map<String, dynamic>> _students = [
    {'name': 'Muhammad Saad Hussain', 'imagePath': 'assets/teacher1.png', 'progress': 0.25, 'color': Colors.red, 'percentage': '25%'},
    {'name': 'Liaqat Hussain', 'imagePath': 'assets/teacher2.png', 'progress': 0.50, 'color': Colors.amber, 'percentage': '50%'},
    {'name': 'Hamza Hussain', 'imagePath': 'assets/teacher3.png', 'progress': 0.75, 'color': Colors.amber, 'percentage': '75%'},
    {'name': 'Amjad Ali', 'imagePath': 'assets/teacher4.png', 'progress': 1.0, 'color': Colors.green, 'percentage': '100%'},
  ];

  List<Map<String, dynamic>> _filteredStudents = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredStudents = _students;
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
      _filteredStudents = _students.where((student) {
        return student['name'].toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          title: const Text(
            'Student List',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
              color: Colors.black87,
            ),
          ),
          iconColor: const Color(0xFF343A40),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                onChanged: _updateSearchQuery,
                decoration: InputDecoration(
                  hintText: 'Search for a student',
                  hintStyle: const TextStyle(color: Colors.black54),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
            ..._filteredStudents.map((student) {
              return _buildStudentTile(
                student['name'],
                student['imagePath'],
                student['progress'],
                student['color'],
                student['percentage'],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentTile(String name, String imagePath, double progress, Color color, String percentage) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      width: screenWidth * 0.85,
      height: screenHeight * 0.09,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Image
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: screenHeight * 0.035,
          ),
          const SizedBox(width: 12),

          // Student Name
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Progress Indicator & Percentage
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                percentage,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.032,
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: screenWidth * 0.15,
                height: 6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),

          // "Details" Button
          TextButton(
            onPressed: () {
              // Action when "Details" is pressed
            },
            child: Text(
              'Details',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: screenWidth * 0.032,
                color: const Color(0xFF1F7BF4),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
