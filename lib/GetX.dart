import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'config.dart';

class ControllerSocket extends GetxController {
  late IO.Socket socket;
  final temp = 0.obs;
  final hum = 0.obs;

  static ControllerSocket get to => Get.find();

  @override
  onInit() {
    super.onInit();
    socket = IO.io('${Config.ip}/', <String, dynamic>{
      'transports': ['websocket'],
      'forceNew': true,
    });
    socket.connect();
  }

  onTriangle() {
    socket.on("triangle", (data) {});
  }

  onTempHum() {
    socket.on("temp", (data) {
      temp.value = data.toInt();
    });
    socket.on("hum", (data) {
      hum.value = data.toInt();
    });
    notifyChildrens();
  }

  send(String data) {
    socket.emit(data, "null " + data);
  }

  close() {
    socket.close();
  }
}
