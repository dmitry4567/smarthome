import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome/kitchen.dart';

import '../GetX.dart';
import 'header.dart';

class TempWidget extends StatelessWidget {
  const TempWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text("${ControllerSocket.to.temp}"));
  }
}
