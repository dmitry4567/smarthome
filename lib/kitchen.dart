import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smarthome/Login.dart';
import 'package:smarthome/widgets/hum.dart';
import 'package:smarthome/widgets/lamp.dart';
import 'package:smarthome/widgets/header.dart';
import 'package:smarthome/widgets/temp.dart';

import 'GetX.dart';

class KitchenPage extends StatefulWidget {
  const KitchenPage({super.key});

  @override
  State<KitchenPage> createState() => _KitchenPageState();
}

class _KitchenPageState extends State<KitchenPage> {
  Widget currentWidget = const LampWidget();
  ControllerSocket socket_contoller = Get.put(ControllerSocket());
  int currentIndex = 0;

  changeWidget(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return LampWidget();
      case 1:
        return TempWidget();
      case 2:
        return HumWidget();
      case 3:
        return LampWidget();
    }
  }

  @override
  void initState() {
    super.initState();
    socket_contoller.onTempHum();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      socket_contoller.send("get_temp");
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      socket_contoller.send("get_hum");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
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
                  const HeaderWidget(name: "Кухня", text: "Устройства"),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 35, right: 35, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              currentIndex = 0;
                              setState(() {});
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Ink(
                              height: 80,
                              width:
                                  (MediaQuery.of(context).size.width - 100) / 4,
                              decoration: currentIndex == 0
                                  ? const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color(0xffBD83E6),
                                          Color(0xff5553F0),
                                        ],
                                      ),
                                    )
                                  : const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Color(0xff9EA5B0),
                                    ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/kitchen/lamp.png",
                                    scale: 15,
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text(
                                    "Свет",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              currentIndex = 1;
                              setState(() {});
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Ink(
                              height: 80,
                              width:
                                  (MediaQuery.of(context).size.width - 100) / 4,
                              decoration: currentIndex == 1
                                  ? const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xffAF26FF),
                                          Color(0xffF14C70),
                                        ],
                                      ),
                                    )
                                  : const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Color(0xff9EA5B0),
                                    ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/kitchen/temp.png",
                                    scale: 4.5,
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text(
                                    "Температура",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              currentIndex = 2;
                              setState(() {});
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Ink(
                              height: 80,
                              width:
                                  (MediaQuery.of(context).size.width - 100) / 4,
                              decoration: currentIndex == 2
                                  ? const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xff6B48FF),
                                          Color(0xff58C4FE),
                                        ],
                                      ),
                                    )
                                  : const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Color(0xff9EA5B0),
                                    ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/kitchen/hum.png",
                                    scale: 3,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "Влажность",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              currentIndex = 3;
                              setState(() {});
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Ink(
                              height: 80,
                              width:
                                  (MediaQuery.of(context).size.width - 100) / 4,
                              decoration: currentIndex == 3
                                  ? const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color(0xff577BE4),
                                          Color(0xffB800F9),
                                        ],
                                      ),
                                    )
                                  : const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Color(0xff9EA5B0),
                                    ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/kitchen/blinds.png",
                                    scale: 2,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    "Жалюзи",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          changeWidget(currentIndex)
        ],
      ),
    );
  }
}
