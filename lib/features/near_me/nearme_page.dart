import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NearMePage extends StatelessWidget {
  const NearMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("NearMePage"),
            ElevatedButton(
                onPressed: () {
                  fetchData();
                },
                child: const Text('Try to Get Data'))
          ],
        ),
      ),
    );
  }
}

Future<void> fetchData() async {
  final response = await http.get(Uri.parse('https://www.googletagmanager.com/gtag/js?id=G-4H6SSV3WYC'));

  // Check for non-200 responses or invalid content types
  if (response.statusCode == 200 && response.headers['content-type']?.contains('application/json') == true) {
    try {
      var data = jsonDecode(response.body);
      print(data);
    } catch (e) {
      print('Failed to parse JSON: $e');
    }
  } else {
    print('Received non-JSON response or non-200 status: ${response.statusCode}');
    print('Response Body: ${response.body}');
  }
}
