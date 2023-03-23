import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<WorldTime>? currentTime;

  String time = 'loading';

  void setupWorldTime() {
    WorldTime instance =
        WorldTime(location: 'Berlin', flag: 'flag', url: 'Europe/Berlin');
    instance.getTime();
    setState(() async => time = instance.time!);
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<WorldTime>(
          future: currentTime,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(time);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
