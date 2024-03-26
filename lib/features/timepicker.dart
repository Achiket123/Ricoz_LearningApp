import 'package:flutter/material.dart';

class TimePickerTextField extends StatefulWidget {
  final Function(TimeOfDay)? onTimeSelected;

  const TimePickerTextField({Key? key, this.onTimeSelected}) : super(key: key);

  @override
  _TimePickerTextFieldState createState() => _TimePickerTextFieldState();
}

class _TimePickerTextFieldState extends State<TimePickerTextField> {
  late TimeOfDay time;

  _selectTime() async {
    TimeOfDay? picker =
        await showTimePicker(context: context, initialTime: time);
    if (picker != null) {
      setState(() {
        time = picker;
        widget.onTimeSelected?.call(time);
      });
    }
  }

  @override
  void initState() {
    time = TimeOfDay.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Removed the clock icon
        SizedBox(width: 8),
        // Text form field
        Expanded(
          child: TextField(
            readOnly: true,
            onTap: () {
              _selectTime();
            },
            // decoration: InputDecoration(
            //   border: OutlineInputBorder(),
            // ),
            controller: TextEditingController(
              text: "${time.hour}:${time.minute}",
            ),
          ),
        ),
        SizedBox(width: 8),
      ],
    );
  }
}
