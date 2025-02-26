import 'package:flutter/material.dart';
import 'package:simple_time_range_picker/simple_time_range_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  TimeOfDay _startTime;
  TimeOfDay _endTime;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child),
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Sampe"),
            ),
            body: Container(
              padding: EdgeInsets.all(50),
              alignment: Alignment.center,
              child: Column(
                children: [
                  //
                  // Example start
                  // -------------
                  //
                  ElevatedButton(
                    child: Text("OpenPicker"),
                    onPressed: () => TimeRangePicker.show(
                      context: context,
                      unSelectedEmpty: false,
                      startTime: TimeOfDay(hour: 19, minute: 45),
                      endTime: TimeOfDay(hour: 21, minute: 22),
                      onSubmitted: (TimeRangeValue value) {
                        setState(() {
                          _startTime = value.startTime;
                          _endTime = value.endTime;
                        });
                      },
                    ),
                  ),
                  Text(
                    "start: ${_timeFormated(_startTime)}",
                  ),
                  Text(
                    "end: ${_timeFormated(_endTime)}",
                  ),
                  //
                  // -------------
                  // Example end
                  //
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _timeFormated(TimeOfDay time) {
    if (time == null) return "--:--";
    return "${time.hour}:${time.minute}";
  }
}
