import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:fitness_tracker/helpers.dart';

class step_tracker extends StatefulWidget {
  const step_tracker({Key? key}) : super(key: key);

  @override
  State<step_tracker> createState() => _step_trackerState();
}

class _step_trackerState extends State<step_tracker> {
  NativeDeviceOrientation _orientation = NativeDeviceOrientation.portraitUp;

  int _steps = 0;

  @override
  void initState() {
    super.initState();
    NativeDeviceOrientationCommunicator()
        .onOrientationChanged(useSensor: true)
        .listen((event) {
      setState(() {
        _orientation = event;
        _steps += 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String steps_format = formatNumber(_steps);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pedometer'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Text(
                  steps_format,
                  style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Text(
                  'Total Steps',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
