// adjust_timetable.dart
import 'package:flutter/material.dart';
import 'package:untitled/TimeTable/models/schedule_model.dart';

class AdjustTimetablePage extends StatefulWidget {
  const AdjustTimetablePage({Key? key}) : super(key: key);

  @override
  _AdjustTimetablePageState createState() => _AdjustTimetablePageState();
}

class _AdjustTimetablePageState extends State<AdjustTimetablePage> {
  List<Schedule> schedules = [
    Schedule(
      id: '1',
      from: 'Islamabad',
      to: 'G14',
      time: '08:00 AM',
      date: '2025-02-01',
    ),
    Schedule(
      id: '2',
      from: 'G14',
      to: 'Islamabad',
      time: '05:00 PM',
      date: '2025-02-01',
    ),
    // Add more schedules as needed
  ];

  void _addOrEditSchedule({Schedule? schedule}) async {
    final result = await showDialog<Schedule>(
      context: context,
      builder: (context) {
        return ScheduleDialog(schedule: schedule);
      },
    );

    if (result != null) {
      setState(() {
        if (schedule == null) {
          // Adding a new schedule
          schedules.add(result);
        } else {
          // Editing existing schedule
          int index = schedules.indexWhere((s) => s.id == schedule.id);
          if (index != -1) {
            schedules[index] = result;
          }
        }
      });
    }
  }

  void _deleteSchedule(String id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Schedule"),
          content: Text("Are you sure you want to delete this schedule?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  schedules.removeWhere((s) => s.id == id);
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Schedule deleted successfully.')),
                );
              },
              child: Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  // Function to generate unique IDs (simple implementation)
  String _generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Timetable'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Padding(
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
                leading: Icon(
                  Icons.directions_bus,
                  color: Colors.deepPurple,
                  size: 40.0,
                ),
                title: Text(
                  '${schedule.from} ➔ ${schedule.to}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.0),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 16.0, color: Colors.grey),
                        SizedBox(width: 5.0),
                        Text(
                          schedule.time,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: [
                        Icon(Icons.date_range, size: 16.0, color: Colors.grey),
                        SizedBox(width: 5.0),
                        Text(
                          schedule.date,
                          style: TextStyle(fontSize: 16.0),
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
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    PopupMenuItem<String>(
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
        child: Icon(Icons.add, color: Colors.white),
        tooltip: 'Add Schedule',
      ),
    );
  }
}

class ScheduleDialog extends StatefulWidget {
  final Schedule? schedule;

  const ScheduleDialog({Key? key, this.schedule}) : super(key: key);

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
          ? TimeOfDay(
        hour: int.parse(widget.schedule!.time.split(':')[0]),
        minute: int.parse(widget.schedule!.time.split(':')[1].split(' ')[0]),
      )
          : TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
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
              // From Field
              TextFormField(
                controller: _fromController,
                decoration: InputDecoration(
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
              SizedBox(height: 10.0),
              // To Field
              TextFormField(
                controller: _toController,
                decoration: InputDecoration(
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
              SizedBox(height: 10.0),
              // Time Field
              TextFormField(
                controller: _timeController,
                decoration: InputDecoration(
                  labelText: 'Time',
                  prefixIcon: Icon(Icons.access_time),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.timer),
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
              SizedBox(height: 10.0),
              // Date Field
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.date_range),
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
          onPressed: () {
            Navigator.of(context).pop(); // Close dialog
          },
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final newSchedule = Schedule(
                id: widget.schedule?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
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
          child:  Text(widget.schedule == null ? "Add" : "Save"),        ),
      ],
    );
  }
}
