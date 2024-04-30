import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_carplay_plus/flutter_carplay_plus.dart';
import 'package:flutter_carplay_plus/ui/fcp_router.dart';
import 'package:flutter_carplay_plus/ui/models/buttons/fcp_bar_button.dart';
import 'package:flutter_carplay_plus/ui/models/templates/fcp_list_template.dart';
import 'package:flutter_carplay_plus/ui/models/templates/fcp_tab_bar_template.dart';
import 'package:flutter_carplay_plus/ui/models/templates/list/fcp_list_item.dart';
import 'package:flutter_carplay_plus/ui/models/templates/list/fcp_list_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _coreApi = FlutterCarplayPlus.coreApi;
  StreamSubscription<CarplayConnectionStatus>? _connectionStatusSub;
  String _carplayConnectionStatus = CarplayConnectionStatus.unknown.name;

  @override
  void initState() {
    super.initState();

    _connectionStatusSub = _coreApi.connectionStatusStream.listen(
      _onCarplayConnectionStatusChanged,
    );
  }

  void _onCarplayConnectionStatusChanged(CarplayConnectionStatus status) {
    setState(() {
      _carplayConnectionStatus = status.name;
    });

    if (status == CarplayConnectionStatus.connected) {
      FCPRouter.setRootTemplate(
        FCPTabBarTemplate(
          templates: [
            FCPListTemplate(
              title: 'List template',
              backButton: FCPBarButton(
                title: ':D',
              ),
              sections: [
                FCPListSection(
                  items: [
                    FCPListItem(text: 'List item!!!'),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }
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
