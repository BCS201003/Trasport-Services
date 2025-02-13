import 'package:flutter/material.dart';
import 'package:untitled/TimeTable/models/schedule_model.dart';
import 'package:untitled/TimeTable/controllers/schedule_shared_prefs_controller.dart';
import 'package:untitled/TimeTable/views/screen/direction_screen.dart';
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
    try {
      await _prefsController.loadSchedules();
    } catch (e) {
      debugPrint('Error loading schedules: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
            style:
            TextStyle(fontSize: 18.0, color: Colors.grey[600]),
          ),
        )
            : ListView.builder(
          itemCount: schedules.length,
          itemBuilder: (context, index) {
            final schedule = schedules[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: const Icon(
                  Icons.directions_bus,
                  color: Colors.blueAccent,
                  size: 40.0,
                  semanticLabel: 'Bus icon',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LiveDirectionScreen(
                        fromlocation: schedule.from,
                        toLocation: schedule.to,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}