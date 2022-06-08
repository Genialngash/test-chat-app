import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'Model/ChatModel.dart';
import 'Screens/CameraScreen.dart';
import 'Screens/Homescreen.dart';
import 'Screens/LoginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "OpenSans",
          primaryColor: Color(0xFF075E54),
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF128C7E))),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ChatModel? sourceChat;
  List<ChatModel> chatmodels = [
    ChatModel(
      name: "Dart Stack",
      isGroup: true,
      currentMessage: "Hi Everyone",
      time: "4:00",
      icon: "person.svg",
      id: 1,
    ),
    ChatModel(
      name: "Ngash",
      isGroup: false,
      currentMessage: "Hi Ngash",
      time: "13:00",
      icon: "person.svg",
      id: 2,
    ),
    ChatModel(
      name: "Danche",
      isGroup: false,
      currentMessage: "Hi Dev Stack",
      time: "8:00",
      icon: "person.svg",
      id: 3,
    ),
    ChatModel(
      name: "Peter John",
      isGroup: false,
      currentMessage: "Hi Dev Stack",
      time: "2:00",
      icon: "person.svg",
      id: 4,
    ),
    ChatModel(
      name: "Developer group",
      isGroup: true,
      currentMessage: "New flutter Post",
      time: "2:00",
      icon: "group.svg",
    ),
  ];
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return Homescreen(
                chatmodels: chatmodels, sourchat: sourceChat ?? ChatModel());
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hela"),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 254, 242, 255),
              Color.fromARGB(255, 228, 239, 245)
            ]),
            image: DecorationImage(
              image: AssetImage("assets/hela.jpg"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
