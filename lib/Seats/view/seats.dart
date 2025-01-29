import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Payment/enroll.dart';
import 'package:untitled/Seats/controller/seatcontroller.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class BusSeatingScreen extends StatefulWidget {
  const BusSeatingScreen({super.key});

  @override
  BusSeatingScreenState createState() => BusSeatingScreenState();
}

class BusSeatingScreenState extends State<BusSeatingScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<SeatingController>(context, listen: false).loadSeatData();
  }

  @override
  Widget build(BuildContext context) {
    SeatingController controller = Provider.of<SeatingController>(context);

    return Scaffold(
      appBar: const CustomAppBar(
        title: "seating plan",
      ),
      body: Column(
        children: [
          // Gender Selection Toggle
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ToggleButtons(
              isSelected: [
                controller.selectedGender == "Ladies",
                controller.selectedGender == "Gents",
              ],
              onPressed: (index) {
                controller.changeGender(index == 0 ? "Ladies" : "Gents");
              },
              borderRadius: BorderRadius.circular(8.0),
              borderColor: Colors.blue,
              selectedBorderColor: Colors.purple,
              fillColor: Colors.blue.withOpacity(0.2),
              selectedColor: Colors.purple,
              color: Colors.blue,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text("Ladies"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text("Gents"),
                ),
              ],
            ),
          ),

          // Seat Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  int row = index ~/ 4;
                  int col = index % 4;
                  var seat = controller.seatStatus[row][col];
                  return GestureDetector(
                    onTap: () {
                      controller.toggleSeat(row, col);
                    },
                    child: Tooltip(
                      message: seat['status'] ?? 'No Status', // Ensure tooltip message is provided
                      child: Container(
                        decoration: BoxDecoration(
                          color: seat['color'],
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 4,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.event_seat,
                          color: seat['color'] == Colors.green
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Save Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Are you sure to save?"),
                      content: const Text("Once saved, you cannot change your selection."),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.lockSeats();
                            controller.saveSeatData();
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EnrollScreen(),
                              ),
                            );
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    );
                  },
                );
              },
              label: const Text("Save"),
              icon: const Icon(Icons.save),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}