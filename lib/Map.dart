import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:smarthome/widgets/header.dart';

import 'GetX.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  ControllerSocket socket_contoller = Get.put(ControllerSocket());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 16),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 16,
              ),
              onPressed: () {
                socket_contoller.close();
                Get.delete<ControllerSocket>();
                Navigator.pop(context);
              },
            ),
          ),
          Column(
            children: [
              const HeaderWidget(name: "Следить\nза роботом", text: ""),
              TextButton(
                onPressed: () async {
                  http.get(Uri.parse('http://127.0.0.1:5000/video_feed'));
                },
                child: Text(
                  'Start Detecting Faces',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
