library chats;

import 'package:flutter/material.dart';
import 'package:senim/screens/app/dashboard/widgets/general_scaffold.dart';

part 'chats_guest_screen.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      title: "Чаты",
      child: Text("hi"),
    );
  }
}
