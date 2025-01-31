// lib/TimeTable/views/adjust_timetable.dart
import 'package:flutter/material.dart';
import 'package:untitled/TimeTable/models/schedule_model.dart';
import 'package:untitled/TimeTable/controllers/schedule_shared_prefs_controller.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';

class AdjustTimetablePage extends StatefulWidget {
  const AdjustTimetablePage({super.key});

  @override
  AdjustTimetablePageState createState() => AdjustTimetablePageState();
}

class AdjustTimetablePageState extends State<AdjustTimetablePage> {
  // Single controller used for admin changes
  final ScheduleSharedPrefsController _prefsController =
  ScheduleSharedPrefsController();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSchedules();
  }

  Future<void> _loadSchedules() async {
    await _prefsController.loadSchedules(); // loads from SharedPreferences
    setState(() {
      _isLoading = false;
    });
  }

  // Show dialog for adding/editing
  void _addOrEditSchedule({Schedule? schedule}) async {
    final result = await showDialog<Schedule>(
      context: context,
      builder: (context) {
        return ScheduleDialog(schedule: schedule);
      },
    );

    if (result != null) {
      if (schedule == null) {
        // ADD
        await _prefsController.addSchedule(result);
      } else {
        // UPDATE
        await _prefsController.updateSchedule(result);
      }
      setState(() {});
    }
  }

  void _deleteSchedule(String id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Schedule"),
          content: const Text("Are you sure you want to delete this schedule?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await _prefsController.deleteSchedule(id);
                Navigator.of(context).pop();
                setState(() {});

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Schedule deleted successfully.')),
                );
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final schedules = _prefsController.schedules;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Manage Timetable'),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: schedules.isEmpty
            ? Center(
          child: Text(
            'No schedules available. Add a new schedule!',
            style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
            textAlign: TextAlign.center,
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
                  color: Colors.deepPurple,
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
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      _addOrEditSchedule(schedule: schedule);
                    } else if (value == 'delete') {
                      _deleteSchedule(schedule.id);
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrEditSchedule(),
        backgroundColor: Colors.deepPurple,
        tooltip: 'Add Schedule',
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

/// DIALOG FOR ADDING/EDITING
class ScheduleDialog extends StatefulWidget {
  final Schedule? schedule;
  const ScheduleDialog({super.key, this.schedule});

  @override
  _ScheduleDialogState createState() => _ScheduleDialogState();
}

class _ScheduleDialogState extends State<ScheduleDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _fromController;
  late TextEditingController _toController;
  late TextEditingController _timeController;
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _fromController = TextEditingController(text: widget.schedule?.from ?? '');
    _toController = TextEditingController(text: widget.schedule?.to ?? '');
    _timeController = TextEditingController(text: widget.schedule?.time ?? '');
    _dateController = TextEditingController(text: widget.schedule?.date ?? '');
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    _timeController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: widget.schedule != null
          ? _parseTime(widget.schedule!.time)
          : TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
  }

  TimeOfDay _parseTime(String timeString) {
    // e.g. "08:00 AM"
    final parts = timeString.split(' ');
    final timePart = parts[0]; // "08:00"
    final amPmPart = parts.length > 1 ? parts[1].toLowerCase() : '';

    final hourMinute = timePart.split(':');
    int hour = int.parse(hourMinute[0]);
    final minute = int.parse(hourMinute[1]);

    if (amPmPart == 'pm' && hour < 12) hour += 12;
    if (amPmPart == 'am' && hour == 12) hour = 0;
    return TimeOfDay(hour: hour, minute: minute);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.schedule != null
          ? DateTime.parse(widget.schedule!.date)
          : DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toIso8601String().split('T')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.schedule == null ? 'Add Schedule' : 'Edit Schedule'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _fromController,
                decoration: const InputDecoration(
                  labelText: 'From',
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter departure location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _toController,
                decoration: const InputDecoration(
                  labelText: 'To',
                  prefixIcon: Icon(Icons.flag),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter destination';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _timeController,
                decoration: InputDecoration(
                  labelText: 'Time',
                  prefixIcon: const Icon(Icons.access_time),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.timer),
                    onPressed: () => _selectTime(context),
                  ),
                ),
                readOnly: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please select time';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  prefixIcon: const Icon(Icons.calendar_today),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.date_range),
                    onPressed: () => _selectDate(context),
                  ),
                ),
                readOnly: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please select date';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final newSchedule = Schedule(
                id: widget.schedule?.id ??
                    DateTime.now().millisecondsSinceEpoch.toString(),
                from: _fromController.text.trim(),
                to: _toController.text.trim(),
                time: _timeController.text.trim(),
                date: _dateController.text.trim(),
              );
              Navigator.of(context).pop(newSchedule);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
          ),
          child: Text(widget.schedule == null ? "Add" : "Save"),
        ),
      ],
    );
  }
}
