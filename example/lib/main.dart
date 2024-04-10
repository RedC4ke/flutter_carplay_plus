import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_carplay_plus/flutter_carplay_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _coreFlutterClient = FlutterCarplayPlus.coreFlutterClient;
  StreamSubscription<CarplayConnectionStatus>? _connectionStatusSub;
  String _carplayConnectionStatus = CarplayConnectionStatus.unknown.name;

  @override
  void initState() {
    super.initState();

    _connectionStatusSub = _coreFlutterClient.connectionStatusStream.listen(
      _onCarplayConnectionStatusChanged,
    );
  }

  void _onCarplayConnectionStatusChanged(CarplayConnectionStatus status) {
    setState(() {
      _carplayConnectionStatus = status.name;
    });
  }

  @override
  Future<void> dispose() async {
    await _connectionStatusSub?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter_carplay_plus example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text('Connection status: $_carplayConnectionStatus'),
            ],
          ),
        ),
      ),
    );
  }
}
