enum DeviceType { bulb, switch_ }

class Device {
  final String id;
  final String name;
  final DeviceType type;
  bool isOn;

  Device({
    required this.id,
    required this.name,
    required this.type,
  }) : isOn = false;

  void toggleState() {
    isOn = !isOn;
  }
}