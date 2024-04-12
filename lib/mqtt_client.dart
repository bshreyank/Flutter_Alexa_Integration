import 'dart:convert';
import 'package:flutter_alexa_integration/device.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttClient {
  MqttServerClient? _client;

  void connect() {
    _client = MqttServerClient('your_mqtt_broker_address', '');
    _client!.connect();
  }

  void disconnect() {
    _client?.disconnect();
  }

  void publishDeviceState(Device device) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(jsonEncode({
      'id': device.id,
      'isOn': device.isOn,
    }));
    _client?.publishMessage('home/devices', MqttQos.atLeastOnce, builder.payload!);
  }
}