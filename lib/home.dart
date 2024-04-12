import 'package:flutter/material.dart';
import 'package:flutter_alexa_integration/device.dart';
import 'package:flutter_alexa_integration/mqtt_client.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final MqttClient _mqttClient = MqttClient();
  final List<Device> _devices = [
    Device(id: '1', name: 'Bulb', type: DeviceType.bulb),
    Device(id: '2', name: 'Switch', type: DeviceType.switch_),
  ];

  @override
  void initState() {
    super.initState();
    _mqttClient.connect();
  }

  @override
  void dispose() {
    _mqttClient.disconnect();
    super.dispose();
  }

  void _toggleDevice(Device device) {
    device.toggleState();
    _mqttClient.publishDeviceState(device);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Automation'),
      ),
      body: ListView.builder(
        itemCount: _devices.length,
        itemBuilder: (context, index) {
          final device = _devices[index];
          return ListTile(
            title: Text(device.name),
            trailing: Switch(
              value: device.isOn,
              onChanged: (_) => _toggleDevice(device),
            ),
          );
        },
      ),
    );
  }
}
