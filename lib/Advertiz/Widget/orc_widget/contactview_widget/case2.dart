import 'package:flutter/material.dart';

class Case2Widget extends StatelessWidget {
  const Case2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadowColor: Colors.black38,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 600),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, double opacity, child) {
                  return Opacity(
                    opacity: opacity,
                    child: child,
                  );
                },
                child: const Text(
                  'Why Choose Our Bus App?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Comparison Table
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 800),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, double opacity, child) {
                  return Opacity(
                    opacity: opacity,
                    child: child,
                  );
                },
                child: Container(
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black54, width: 1),
                  ),
                  child: Column(
                    children: [
                      // Header Row
                      _buildTableRow(
                        ['Feature', 'Our App', 'Other Apps'],
                        isHeader: true,
                      ),
                      const Divider(thickness: 1, color: Colors.black),

                      // Feature Rows
                      _buildTableRow(
                        ['Real-time Tracking', '✅ Yes', '⚠️ Limited'],
                      ),
                      _buildTableRow(
                        ['Route Planning', '✅ Smart AI', '❌ Basic'],
                      ),
                      _buildTableRow(
                        ['Instant Booking', '✅ 1-Click', '⚠️ Slow'],
                      ),
                      _buildTableRow(
                        ['Payment Options', '✅ Cashless & Online', '❌ Cash Only'],
                      ),
                      _buildTableRow(
                        ['Safety Alerts', '✅ Live Updates', '❌ No Alerts'],
                      ),

                      // Gradient Divider for Modern Look
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: double.infinity,
                          height: 3,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.amber.shade700,
                                Colors.black,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a table row
  Widget _buildTableRow(List<String> cells, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: cells.map((cell) {
          return Expanded(
            child: Text(
              cell,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isHeader ? 16 : 14,
                fontWeight: isHeader ? FontWeight.bold : FontWeight.w500,
                color: isHeader ? Colors.black : Colors.black87,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
