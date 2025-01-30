import 'package:flutter/material.dart';

class ForSearch extends StatelessWidget {
  const ForSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent, // Removes extra dividers
          ),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
            leading: const Icon(Icons.search, color: Color(0xFF343A40)), // Search icon
            title: const Text(
              'Search Students and Teachers',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
                color: Colors.black,
              ),
            ),
            iconColor: const Color(0xFF343A40),
            children: [
              _buildListTile('Bacture Graduate'),
              _buildListTile('Master Graduate'),
              _buildListTile('Dr. Graduate'),
            ],
          ),
        ),
      ),
    );
  }

  // Custom ListTile for better spacing and alignment
  Widget _buildListTile(String title) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14.5,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.2,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      leading: const Icon(Icons.school, size: 20, color: Colors.black54),
    );
  }
}
