import 'package:flutter/material.dart';

class TeacherListContainer extends StatefulWidget {
  const TeacherListContainer({super.key});

  @override
  TeacherListContainerState createState() => TeacherListContainerState();
}

class TeacherListContainerState extends State<TeacherListContainer> {
  final List<Map<String, dynamic>> _teachers = [
    {'name': 'Fyez Irfan', 'imagePath': 'assets/teacher1.png', 'progress': 0.25, 'color': Colors.red, 'percentage': '25%'},
    {'name': 'Muhammad Ali Khan', 'imagePath': 'assets/teacher2.png', 'progress': 0.50, 'color': Colors.yellow, 'percentage': '50%'},
    {'name': 'Ayesha Ahmed', 'imagePath': 'assets/teacher3.png', 'progress': 0.75, 'color': Colors.yellow, 'percentage': '75%'},
    {'name': 'Sara Ali', 'imagePath': 'assets/teacher4.png', 'progress': 1.0, 'color': Colors.green, 'percentage': '100%'},
  ];

  List<Map<String, dynamic>> _filteredTeachers = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredTeachers = _teachers;
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
      _filteredTeachers = _teachers.where((teacher) {
        return teacher['name'].toLowerCase().contains(_searchQuery.toLowerCase());
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
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          title: const Text(
            'Teacher List',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconColor: const Color(0xFF343A40),
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: TextField(
                onChanged: _updateSearchQuery,
                decoration: InputDecoration(
                  hintText: 'Search for a teacher',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
            ..._filteredTeachers.map((teacher) {
              return _buildTeacherTile(
                teacher['name'],
                teacher['imagePath'],
                teacher['progress'],
                teacher['color'],
                teacher['percentage'],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTeacherTile(String name, String imagePath, double progress, Color color, String percentage) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: screenHeight * 0.005,
        horizontal: screenWidth * 0.02,
      ),
      padding: EdgeInsets.all(screenWidth * 0.02),
      width: screenWidth * 0.85,
      height: screenHeight * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: screenHeight * 0.03,
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                percentage,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.03,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              SizedBox(
                width: screenWidth * 0.15,
                height: screenHeight * 0.01,
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
            ],
          ),
          SizedBox(width: screenWidth * 0.03),
          TextButton(
            onPressed: () {
              // Action when "Log In as Teacher" is pressed
            },
            child: Text(
              'Log In as Teacher',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: screenWidth * 0.03,
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
