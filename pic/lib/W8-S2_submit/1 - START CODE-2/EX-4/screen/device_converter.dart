import 'package:flutter/material.dart';

enum DeviceCon {
  euro,
  riel,
  dong,
}

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final TextEditingController _controller = TextEditingController();
  DeviceCon _selectedDevice = DeviceCon.euro;
  String _convertedAmount = '';

  double _convert(double amount) {
    switch (_selectedDevice) {
      case DeviceCon.euro:
        return amount * 0.85; 
      case DeviceCon.riel:
        return amount * 4100; 
      case DeviceCon.dong:
        return amount * 23000; 
      default:
        return 0.0;
    }
  }

  void _updateConvertedAmount() {
    final double? amount = double.tryParse(_controller.text);
    if (amount != null) {
      final converted = _convert(amount);
      setState(() {
        _convertedAmount = converted.toStringAsFixed(2);
      });
    } else {
      setState(() {
        _convertedAmount = ''; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.money,
              size: 60,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Amount in dollars:"),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefix: const Text('\$ '),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter an amount in dollar',
                hintStyle: const TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _updateConvertedAmount(); 
              },
            ),
            const SizedBox(height: 30),
            DropdownButton<DeviceCon>(
              value: _selectedDevice,
              items: DeviceCon.values.map((DeviceCon value) {
                return DropdownMenuItem<DeviceCon>(
                  value: value,
                  child: Text(value.toString().split('.').last),
                );
              }).toList(),
              onChanged: (DeviceCon? value) {
                setState(() {
                  _selectedDevice = value!;
                  _updateConvertedAmount(); 
                });
              },
            ),
            const SizedBox(height: 30),
            const Text("Amount in selected device:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _convertedAmount.isNotEmpty ? _convertedAmount : 'TODO !',
              ),
            ),
          ],
        ),
      ),
    );
  }
}