import 'package:flutter/material.dart';

import '../CustomUI/ButtonCard.dart';
import '../CustomUI/ContactCard.dart';
import '../Model/ChatModel.dart';
import 'CreateGroup.dart';

class SelectContact extends StatefulWidget {
  SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(name: "Developer Stack", status: "A golang developer"),
      ChatModel(name: "Danche", status: "Flutter Developer..........."),
      ChatModel(name: "Nganga", status: "Web developer..."),
      ChatModel(name: "Ngash Dev", status: "App developer...."),
      ChatModel(name: "Hela", status: "Angular developer.."),
      ChatModel(name: "Peter", status: "Full Stack Web"),
      ChatModel(name: "Testing1", status: "Example work"),
      ChatModel(name: "Testing2", status: "Code Magic"),
      ChatModel(name: "Physicist", status: "..✅..."),
      ChatModel(name: "Helper", status: "African Kenya , pan-African"),
      ChatModel(name: "Tester", status: "I find the bugs"),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Contact",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "256 contacts",
                style: TextStyle(
                  fontSize: 13,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 26,
                ),
                onPressed: () {}),
            PopupMenuButton<String>(
              padding: EdgeInsets.all(0),
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext contesxt) {
                return [
                  PopupMenuItem(
                    child: Text("Invite a friend"),
                    value: "Invite a friend",
                  ),
                  PopupMenuItem(
                    child: Text("Contacts"),
                    value: "Contacts",
                  ),
                  PopupMenuItem(
                    child: Text("Refresh"),
                    value: "Refresh",
                  ),
                  PopupMenuItem(
                    child: Text("Help"),
                    value: "Help",
                  ),
                ];
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 254, 242, 255),
              Color.fromARGB(255, 228, 239, 245)
            ]),
          ),
          child: ListView.builder(
              itemCount: contacts.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => CreateGroup()));
                    },
                    child: ButtonCard(
                      icon: Icons.group,
                      name: "New group",
                    ),
                  );
                } else if (index == 1) {
                  return ButtonCard(
                    icon: Icons.person_add,
                    name: "New contact",
                  );
                }
                return ContactCard(
                  contact: contacts[index - 2],
                );
              }),
        ));
  }
}
