import 'package:flutter/material.dart';

import '../CustomUI/CustomCard.dart';
import '../Model/ChatModel.dart';
import '../Screens/SelectContact.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key, required this.chatmodels, required this.sourchat})
      : super(key: key);
  final List<ChatModel> chatmodels;
  final ChatModel sourchat;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 254, 242, 255),
            Color.fromARGB(255, 228, 239, 245)
          ]),
          // image: DecorationImage(
          //   image: AssetImage("assets/3.jpg"),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: ListView.builder(
          itemCount: widget.chatmodels.length,
          itemBuilder: (contex, index) => CustomCard(
            chatModel: widget.chatmodels[index],
            sourchat: widget.sourchat,
          ),
        ),
      ),
    );
  }
}
