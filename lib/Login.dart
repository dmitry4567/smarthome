// ignore_for_file: file_names
import 'package:smarthome/main.dart';
import 'package:universal_io/io.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

import 'config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _logincontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();

  bool _passVis = true;

  _login(String login, String password) async {
    // String url = '${Config.ip}/login';
    // Map data = {'username': login, 'password': password};
    // HttpClient httpClient = HttpClient();
    // HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    // request.headers.set('content-type', 'application/json');
    // request.add(utf8.encode(json.encode(data)));
    // HttpClientResponse response = await request.close();
    // // if (request is BrowserHttpClientRequest) {
    // //   request.browserCredentialsMode = true;
    // // }
    // String reply = await response.transform(utf8.decoder).join();
    // httpClient.close();

    // var jsonData = json.decode(reply);

    // if (response.statusCode == 200) {
    //   setState(() {
    //     print(jsonData);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
    //   });
    // }
    // return reply;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Image.asset(
                    'assets/logo.png',
                    scale: 3,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 40, left: 45, bottom: 5),
                  child: const Text(
                    "Имя",
                    style: TextStyle(
                      color: Color.fromRGBO(77, 77, 77, 0.5),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(right: 35, left: 35, bottom: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(242, 242, 242, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: _logincontroller,
                      style: const TextStyle(color: Colors.black),
                      cursorWidth: 1,
                      maxLength: 20,
                      cursorColor: const Color(0xff6726FF),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(77, 77, 77, 1),
                          fontSize: 16,
                        ),
                        counterStyle: TextStyle(
                          height: double.minPositive,
                        ),
                        counterText: "",
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 45, bottom: 5),
                  child: const Text(
                    "Код доступа",
                    style: TextStyle(
                      color: Color.fromRGBO(77, 77, 77, 0.5),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 35, left: 35),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(242, 242, 242, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      obscureText: _passVis,
                      controller: _passcontroller,
                      style: const TextStyle(color: Colors.black),
                      cursorWidth: 1,
                      maxLength: 20,
                      cursorColor: const Color(0xff6726FF),
                      decoration: InputDecoration(
                        counterStyle: const TextStyle(
                          height: double.minPositive,
                        ),
                        counterText: "",
                        suffixIcon: IconButton(
                          splashRadius: 1.0,
                          icon: _passVis
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                ),
                          onPressed: () {
                            setState(() {
                              _passVis = !_passVis;
                            });
                          },
                        ),
                        border: InputBorder.none,
                        hintStyle: const TextStyle(
                          color: Color.fromRGBO(77, 77, 77, 1),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, right: 35, left: 35),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _login(_logincontroller.text, _passcontroller.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff6726FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Войти',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
