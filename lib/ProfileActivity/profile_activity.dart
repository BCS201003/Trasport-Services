import 'package:flutter/material.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;

  final List<String> _titles = ["Personal Info", "Experience", "Review"];

  final List<Widget> _sections = [
    const PersonalInfoSection(),
    const ExperienceSection(),
    const ReviewSection(),
  ];

  void _onSectionChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Profile"),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_titles.length, (index) {
              return TextButton(
                onPressed: () => _onSectionChanged(index),
                child: Text(
                  _titles[index],
                  style: TextStyle(
                    color: _selectedIndex == index ? Colors.blue : Colors.grey,
                    fontSize: 18,
                  ),
                ),
              );
            }),
          ),
          Expanded(
            child: _sections[_selectedIndex],
          ),
        ],
      ),
    );
  }
}

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Name: Muhammad Saad Hussain\nFather: Liaqat Hussain\nPhone no. + 92 3128889408',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Name: Muhammad Saad Hussain\nFather: Liaqat Hussain\nPhone no. + 92 3128889408',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Name: Muhammad Saad Hussain\nFather: Liaqat Hussain\nPhone no. + 92 3128889408',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}