import 'package:flutter/material.dart';

import '../CustomUI/ButtonCard.dart';
import '../Model/ChatModel.dart';
import 'Homescreen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Test Chat App"),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 254, 242, 255),
              Color.fromARGB(255, 228, 239, 245)
            ]),
          ),
          child: ListView.builder(
              itemCount: chatmodels.length,
              itemBuilder: (contex, index) => InkWell(
                    onTap: () {
                      sourceChat = chatmodels.removeAt(index);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => Homescreen(
                                    chatmodels: chatmodels,
                                    sourchat: sourceChat ?? ChatModel(),
                                  )));
                    },
                    child: ButtonCard(
                      name: chatmodels[index].name,
                      icon: Icons.person,
                    ),
                  )),
        ),
      ),
    );
  }
}
