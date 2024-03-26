import 'package:flutter/material.dart';

class buildTimeTable extends StatefulWidget {
  @override
  _buildTimeTableState createState() => _buildTimeTableState();
}

class _buildTimeTableState extends State<buildTimeTable> {
  List<int> selectedContainerIndices = [];
  final List<String> daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  @override
  Widget build(BuildContext context) {
    return _buildTimeTable();
  }

  Widget _buildTimeTable() {
    return Column(
      children: [
        for (int i = 0; i < 7; i++) _buildTimeTableRow(i),
      ],
    );
  }

  Color _getContainerColor(int index) {
    return (index % 2 == 0) ? const Color(0xFFFC98BE) : const Color(0xFFCEE5F2);
  }

  Color _getContainerColor2(int index) {
    return (index % 2 == 0)
        ? const Color(0xFFFCD7E5)
        : Color.fromARGB(255, 218, 227, 232);
  }

  Widget _buildTimeTableRow(int i) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Text(
              daysOfWeek[i],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (selectedContainerIndices.contains(i)) {
                selectedContainerIndices.remove(i);
              } else {
                selectedContainerIndices.add(i);
              }
            });
          },
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedContainerIndices.contains(i)
                        ? Colors.transparent
                        : Colors.grey,
                  ),
                  color: selectedContainerIndices.contains(i)
                      ? _getContainerColor2(i)
                      : null,
                ),
                height: MediaQuery.of(context).size.width * 0.07,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Text(
                      i.isEven ? "sci" : "maths",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedContainerIndices.contains(i)
                        ? Colors.transparent
                        : Colors.grey,
                  ),
                  color: selectedContainerIndices.contains(i)
                      ? _getContainerColor(i)
                      : null,
                ),
                height: MediaQuery.of(context).size.width * 0.07,
                width: MediaQuery.of(context).size.width * 0.38,
                child: Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Text(
                      i.isEven ? "7-8 p.m." : "8-9 p.m.",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
