// lib/TimeTable/views/timetable.dart
import 'package:flutter/material.dart';
import 'package:untitled/TimeTable/models/schedule_model.dart';
import 'package:untitled/TimeTable/controllers/schedule_shared_prefs_controller.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  TimetablePageState createState() => TimetablePageState();
}

class TimetablePageState extends State<TimetablePage> {
  final ScheduleSharedPrefsController _prefsController =
  ScheduleSharedPrefsController();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSchedules();
  }

  Future<void> _loadSchedules() async {
    await _prefsController.loadSchedules(); // load from SharedPreferences
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Schedule> schedules = _prefsController.schedules;

    return Scaffold(
      appBar: const CustomAppBar(title: 'My Timetable'),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: schedules.isEmpty
            ? Center(
          child: Text(
            'No schedules available.',
            style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
          ),
        )
            : ListView.builder(
          itemCount: schedules.length,
          itemBuilder: (context, index) {
            final schedule = schedules[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.directions_bus,
                  color: Colors.blueAccent,
                  size: 40.0,
                ),
                title: Text(
                  '${schedule.from} ➔ ${schedule.to}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5.0),
                    Row(
                      children: [
                        const Icon(Icons.access_time,
                            size: 16.0, color: Colors.grey),
                        const SizedBox(width: 5.0),
                        Text(
                          schedule.time,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      children: [
                        const Icon(Icons.date_range,
                            size: 16.0, color: Colors.grey),
                        const SizedBox(width: 5.0),
                        Text(
                          schedule.date,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: Colors.grey),
                onTap: () {

                },
              ),
            );
          },
        ),
      ),
    );
  }
}
